# RPM

* <http://www.rpm.org/> - [Docs](http://www.rpm.org/wiki/Docs)
* [RPM Maven Plugin](http://www.mojohaus.org/rpm-maven-plugin/index.html)

Books
* [Fedora RPM Guide](https://docs.fedoraproject.org/en-US/Fedora_Draft_Documentation/0.1/html/RPM_Guide/index.html)
* [Maximum RPM](http://www.rpm.org/max-rpm/)
 
##  Creation

Directory structure ([ref](http://www.rpm.org/max-rpm/ch-rpm-build.html)), default parent of `/usr/src/redhat`:
* `SOURCES` - Original sources, patches, and icon files.
* `SPECS` - Spec files used to control the build process.
* `BUILD` - The directory in which the sources are unpacked, and the software is built.
* `RPMS` — Binary package files created by the build process.
* `SRPMS` — Source package files created by the build process.

## Spec File format

### Preamble ([ref](http://www.rpm.org/max-rpm/s1-rpm-build-creating-spec-file.html)):
Only `name`, `version`, `release`, and `source` actually affect the packaging process.
```
#
# Example spec file
#
Summary: A CD player app that rocks!
Name: cdplayer

# Version of the software being packaged
Version: 1.0

# Package's version umber (how many times the software at its present version has been released)
Release: 1
Copyright: GPL
Group: Applications/Sound

# Name of the source file (basename of value), and where the source file is obtained.
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

### %prep
Remove remnants of any previous builds, and prepare the `BUILD` directory (as a `sh` script).
```sh
%prep
rm -rf $RPM_BUILD_DIR/cdplayer-1.0
zcat $RPM_SOURCE_DIR/cdplayer-1.0.tgz | tar -xvf -
```
Setup macro:
```sh
%prep
%setup
```

### %build
Perform the build as a `sh` script.
```sh
%build
make
```

### %install
Install the application, as a `sh` script.
```sh
%build
make install
```

### %files
List the files that are part of the package (full paths, which will also be their destination when installed)
```sh
%files
# Mark a file as docuemntation (placed in a package-specific directory
# in /usr/doc/<package-name-version>)
%doc README
/usr/local/bin/cdp
/usr/local/bin/cdplay
/usr/local/man/man1/cdp.1
```

### %clean
Clean up files that are not part of an application's normal build area (e.g. `/tmp').

## Macros
* [ref](http://www.rpm.org/max-rpm/s1-rpm-inside-macros.html)
