# RPM

* <http://www.rpm.org/> - [Docs](http://www.rpm.org/wiki/Docs)
* [RPM Maven Plugin](http://www.mojohaus.org/rpm-maven-plugin/index.html)

Books
* [Fedora RPM Guide](https://docs.fedoraproject.org/en-US/Fedora_Draft_Documentation/0.1/html/RPM_Guide/index.html)
* [Maximum RPM](http://www.rpm.org/max-rpm/)

## TODO
* Signing packages

## Setup
Might need to install rpmbuild:
```
sudo yum install -y rpm-build
```

## Commands

Building packages ([ref](http://www.rpm.org/max-rpm/s1-rpm-build-starting-build.html)) with [rpmbuild](https://docs.fedoraproject.org/en-US/Fedora_Draft_Documentation/0.1/html/RPM_Guide/ch-rpmbuild.html)
```sh
cd /usr/src/redhat/SPECS

# -ba build binary and source packages 
rpmbuild -ba cdplayer-1.0.spec

# -bb build binary package (after %prep, %build, %install)q
rpmbuild -bb cdplayer-1.0.spec

# Test the build (don't build anything, but parse and check for errors)
rpmbuild -bb --nobuild my.spec

# Clean up - remove the build tree when complete
rpmbuild --clean my.spec

# Use --define='MACRO EXPR' to define MACRO with value EXPR
rpmbuild -bb --define "release ${ARTIFACT_BUILD_NO}" \
  --define "%_topdir ${WORKSPACE}" SPECS/my.spec

# Check the %files list for missing files (because it is manually created and might be incorrect)
rpmbuild -bl -vv cdplayer-1.0.spec

# Check for files over 1 hour old (3600 seconds) 
rpm -bl --timecheck 3600 cdplayer-1.0.spec
```

Short-circuiting builds (to speed up development of a spec file)
```sh
# Just run %build (skipping %prep) from specfile
rpmbuild -bc --short-circuit SPECS/my.spec

# Just run %install (skipping %prep and %build) from specfile
rpmbuild -bi --short-circuit SPECS/my.spec
```

Installing packages ([ref](http://www.rpm.org/max-rpm/ch-rpm-install.html))
```sh
rpm -i file.rpm
```

Uninstalling packages  (incl. pre and post) ([ref](http://www.rpm.org/max-rpm/ch-rpm-erase.html))
```sh
rpm -e pgk
```

Viewing metadata in an .rpm file ([ref](http://www.cyberciti.biz/faq/rhel-list-package-specific-scriptlets/))
```sh
rpm -qp -i /repo/Centos/5.9/APPS/jdk-7u7-linux-x64.rpm 
```

Add a file to a repo
```sh
# Copy .rpm into repository directory
# (Make sure it is readable by all, otherwise you'll get 403 Forbidden when accessing it!)
# then:
createrepo --update -s sha1 5.9/STABLE/
```

## Yum

Show available versions of a package ([SO](http://unix.stackexchange.com/a/151690/32390)):
```sh
yum --showduplicates list jdk
```

List available repositories
```sh
yum listrepos
```

Add a repository
```sh
echo -e "[apps]\n\
enabled=1\n\
baseurl=http://my-repo.com/\n\
gpgcheck=0\n\
name=My yum repo" > /etc/yum.repos.d/my.repo && yum upgrade
```

##  Creation

Directory structure ([ref](http://www.rpm.org/max-rpm/ch-rpm-build.html)), default parent of `/usr/src/redhat`:
* `SOURCES` - Original sources, patches, and icon files.
* `SPECS` - Spec files used to control the build process.
* `BUILD` - The directory in which the sources are unpacked, and the software is built.
* `RPMS` — Binary package files created by the build process.
* `SRPMS` — Source package files created by the build process.

## Spec File format
* Comments: `# comment`
* Macro expansion, using `%{MACRO_NAME}`:
```sh
# Where release was defined on the command line as --define "release 3"
Release: %{release}
```

### Preamble ([ref](http://www.rpm.org/max-rpm/s1-rpm-build-creating-spec-file.html)):
Only `name`, `version`, `release`, and `source` actually affect the packaging process - the package name is always: `<name>-<version>-<release>`

```sh
#
# Example spec file
#
Summary: A CD player app that rocks!
Name: cdplayer

# Version of the software being packaged
Version: 1.0

# Package's version umber (how many times the software at its present version has been released,
# start at 1, and reset to 1 when there is a new Version)
Release: 1

Copyright: GPL
Group: Applications/Sound

# Name of the source file (basename of value), and where the source file is obtained
# (though RPM will not download them)
# Specify Source0, Source1, ... if there are more than one source file.
Source: ftp://ftp.gnomovision.com/pub/cdplayer/cdplayer-1.0.tgz

# Documentation of the software being packaged
URL: http://www.gnomovision.com/cdplayer/cdplayer.html
Distribution: WSS Linux
Vendor: White Socks Software, Inc.
Packager: Santa Claus <sclaus@northpole.com>

%description
It slices!  It dices!  It's a CD player app that
can't be beat.  By using the resonant frequency
of the CD itself, it is able to simulate 20X
oversampling.  This leads to sound quality that
cannot be equaled with more mundane software...
```

[Tag reference](http://www.rpm.org/max-rpm/s1-rpm-inside-tags.html)

Locations:
* [Buildroot](https://docs.fedoraproject.org/en-US/Fedora_Draft_Documentation/0.1/html/RPM_Guide/ch09s03s02.html) - staging area that looks like the final installation directory (which is usually `/`).  Can be overridden by with the `--buildroot` command-line parameter.
```
Buildroot: %{_tmppath}/%{name}-%{version}-%{release}-root
```

Dependency tags:
```
Provides: mail-reader
Requires: playmidi >= 2.3
# Packages that cannot be installed (with release number)
Conflicts: playmidi = 2.3-1
```

### [Scripts](http://www.rpm.org/max-rpm/s1-rpm-inside-scripts.html)
* [Fedora styleguide](http://fedoraproject.org/wiki/Packaging:SysVInitScript#Why_don.27t_we)

Common variables:
```sh
RPM_SOURCE_DIR="/usr/src/redhat/SOURCES"
RPM_BUILD_DIR="/usr/src/redhat/BUILD"
RPM_DOC_DIR="/usr/doc"
RPM_OPT_FLAGS="-O2 -m486 -fno-strength-reduce"
RPM_ARCH="i386"
RPM_OS="Linux"
RPM_ROOT_DIR="/tmp/cdplayer"
RPM_BUILD_ROOT="/tmp/cdplayer"
RPM_PACKAGE_NAME="cdplayer"
RPM_PACKAGE_VERSION="1.0"
RPM_PACKAGE_RELEASE="1"
```

### %prep
Remove remnants of any previous builds, and prepare the `BUILD` directory (as a `sh` script).
```sh
%prep
rm -rf $RPM_BUILD_DIR/cdplayer-1.0
zcat $RPM_SOURCE_DIR/cdplayer-1.0.tgz | tar -xvf -
```
Setup macro ([ref](https://docs.fedoraproject.org/en-US/Fedora_Draft_Documentation/0.1/html/RPM_Guide/ch09s04.html))
- changes to `BUILD`, and extracts the source files (tar, zip, gzip, tar-gzip bzip2, pack, compress, lzh).
```sh
%prep
%setup

# Create the directory before unpacking (if not in archive)
%setup -c -n name -q
```

### %build
Perform the build as a `sh` script.
```sh
%build
make
```

`%configure` macro sets many environment variables ([ref](https://docs.fedoraproject.org/en-US/Fedora_Draft_Documentation/0.1/html/RPM_Guide/ch09s04s02.html)), view them with:
```sh
rpm --eval '%configure'
```

### %install
Install the application, as a `sh` script.
```sh
%build
make install
```

### %clean
Clean up files that are not part of an application's normal build area (e.g. `/tmp').
e.g. if you set a buildroot ([ref](https://docs.fedoraproject.org/en-US/Fedora_Draft_Documentation/0.1/html/RPM_Guide/ch09s04s04.html)):
```sh
%clean
rm -rf $RPM_BUILD_ROOT
```

Install/Erase-time scriptlets [ref](https://fedoraproject.org/wiki/Packaging:ScriptletSnippets)

Argument `$1` is the number of times the package has been installed _after_ the operation has completed (e.g. `%pre` and `%post` will have `$1=1` for the first installation, and `%preun` and `%postun` will have `$1=0` for the last uninstallation)
* `%pre` - Executes just before the package is to be installed.
* `%post` - Executes just after the package has been installed.
* `%preun` - Executes just before the package is uninstalled.
* `%postun` - Executes just after the package is uninstalled.

Should always exit with a status of 0, unless there is a serious error (and letting it proceed would be worse) [ref](https://fedoraproject.org/wiki/Packaging:ScriptletSnippets) and [ref](http://lists.rpm.org/pipermail/rpm-list/2014-December/001669.html).
```sh
exit 0
# or
my last command || :
```

[e.g.](https://docs.fedoraproject.org/en-US/Fedora_Draft_Documentation/0.1/html/RPM_Guide/ch09s04s05.html)
```sh
%post
/sbin/chkconfig --add ypbind

%preun
if [ "$1" = 0 ] ; then
  /sbin/service ypbind stop > /dev/null 2>&1
  /sbin/chkconfig --del ypbind
fi
exit 0

%postun
if [ "$1" -ge 1 ]; then
  /sbin/service ypbind condrestart > /dev/null 2>&1
fi
exit 0
```

### %verifyscript

### %files
List the files that are part of the package (full paths, which will also be their destination when installed).

Files can have [directives](http://www.rpm.org/max-rpm/s1-rpm-inside-files-list-directives.html)
```sh
%files
# Mark a file as docuemntation (placed in a package-specific directory
# in /usr/doc/<package-name-version>)
%doc README
/usr/local/bin/cdp
/usr/local/bin/cdplay
/usr/local/man/man1/cdp.1

# Set attributes (if not installed with those attributes):
# %attr (<mode>, <user>, <group) file
%attr(755, root, root) foo.bar
            
# Use - to avoid changing an attribute (because it was intalled with that attribute)
# e.g. don't set the file's user:
%attr(755, -, root) foo.bar

# Only include the directory and not its contents
%dir /usr/blather

# Also: %config, %docdir, %verify, %files -f <file>
```

### %changelog ([ref](https://docs.fedoraproject.org/en-US/Fedora_Draft_Documentation/0.1/html/RPM_Guide/ch22s05.html))
Appears at the end of a spec file, listing significant changes:
```
%changelog
* Fri Jun 21 2002 Bob Marley <marley@redhat.com>
- automated rebuild
* Tue May 08 2001 Peter Tosh <tosh@redhat.com> 1.3-1
- updated to 1.3
```

## Macros
* Built-in macros - [API](http://rpm.org/api/4.4.2.2/config_macros.html), [Fedora wiki](https://fedoraproject.org/wiki/Packaging:RPMMacros?rd=Packaging/RPMMacros)
  * [Variable definition](https://docs.fedoraproject.org/en-US/Fedora_Draft_Documentation/0.1/html/RPM_Guide/ch22s02.html)
  * [Conditional](https://docs.fedoraproject.org/en-US/Fedora_Draft_Documentation/0.1/html/RPM_Guide/ch22s02s02.html)
  * [Built-in](https://docs.fedoraproject.org/en-US/Fedora_Draft_Documentation/0.1/html/RPM_Guide/ch22s02s03.html)
* [Built-in macros](https://docs.fedoraproject.org/en-US/Fedora_Draft_Documentation/0.1/html/RPM_Guide/ch22s02.html)
* [ref](http://www.rpm.org/max-rpm/s1-rpm-inside-macros.html)
