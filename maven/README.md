# Maven Notes

* [POM descriptor reference](http://maven.apache.org/ref/3-LATEST/maven-model/maven.html)
* [Plugins](http://maven.apache.org/plugins/)
* [Maven Central search](http://search.maven.org/)
* [Maven: The Complete Reference](https://books.sonatype.com/mvnref-book/reference/) (book)
* [Lifecycle Reference](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html#Lifecycle_Reference)

## Multi-module

```bash
#Run a single goal with debug (-X)
mvn assembly:single -X

#Run a single execution (@)
mvn dependency:unpack@unpack-tomcat

#Run against a single submodule
mvn package -pl henry-ee-database -am
```

## FAQ

* [How does Maven handle multiple use of the same plugin in one POM?](https://mail-archives.apache.org/mod_mbox/maven-users/200908.mbox/%3C88c1b40908200129h29745c6ft82c3340a151caf32@mail.gmail.com%3E)

	In any one build section, you should only ever list a plugin once.
	When profiles are activated, the configurations for each profile are
	merged with the main build... which is why you put id's on executions,
	if the id is the same then it will merge the execution details, if the
	id's are different, then you get two executions

## Profiles

* [Maven reference](https://books.sonatype.com/mvnref-book/reference/profiles.html)

Run with selected profiles:

```bash
mvn compile -Pprofile1,profile2
```

Disable profiles with a `!` prefix ([SO](http://stackoverflow.com/a/21991718/125246)):

```bash
mvn compile -P\!profile1,profile2  # disable profile1, enable profile2, have to escape !
```

List active profiles ([ref](https://books.sonatype.com/mvnref-book/reference/profiles-sect-listing-active-profiles.html):

```bash
mvn help:active-profiles
```

Elements allowed in a profile ([ref](https://books.sonatype.com/mvnref-book/reference/profiles-sect-maven-profiles.html)

```xml
<profiles>
	<profile>
	    <id>my-profile-id</id>
	    <activation>...</activation>
	    <build>
	        <defaultGoal>...</defaultGoal>
	        <finalName>...</finalName>
	        <resources>...</resources>
	        <testResources>...</testResources>
	        <plugins>...</plugins>
	    </build>
	    <reporting>...</reporting>
	    <modules>...</modules>
	    <dependencies>...</dependencies>
	    <dependencyManagement>...</dependencyManagement>
	    <distributionManagement>...</distributionManagement>
	    <repositories>...</repositories>
	    <pluginRepositories>...</pluginRepositories>
	    <properties>...</properties>
	</profile>
</profiles>
```

[Activation](http://maven.apache.org/pom.html#Activation):

```xml
<activeByDefault>false</activeByDefault>
<jdk>1.5</jdk>
<os>
  <name>Windows XP</name>
  <family>Windows</family>
  <arch>x86</arch>
  <version>5.1.2600</version>
</os>
<!-- System properties -Dsysprop=value, not Maven properties -->
<property>
  <name>sparrow-type</name>
  <value>African</value>
</property>
<!-- System property defined (any value) -->
<property>
  <name>my-prop</value>
</property>
<!-- System property not defined -->
<property>
  <name>!my-prop</value>
</property>
<file>
  <exists>${basedir}/file2.properties</exists>
  <missing>${basedir}/file1.properties</missing>
</file>
```

* `activeByDefault=true` only enabled if no other profiles are active.
  * An alternative would be to set a system property and use that to select profiles ([ref](https://books.sonatype.com/mvnref-book/reference/profiles-sect-tips-tricks.html))
* `property/name=!my-prop` activated if property is *not* set ([ref](https://earlyandoften.wordpress.com/2011/02/09/disable-maven-profile/)

## Plugins

* [Main Index](http://maven.apache.org/plugins/index.html),
  [Codehaus MojoHaus Index](http://www.mojohaus.org/plugins.html)
  ([Github](https://github.com/mojohaus))
* [assembly](http://maven.apache.org/plugins/maven-assembly-plugin/) -
  [goals](http://maven.apache.org/plugins/maven-assembly-plugin/plugin-info.html),
  [descriptor format](http://maven.apache.org/plugins/maven-assembly-plugin/assembly.html)
  
	[SO](http://stackoverflow.com/a/28506199/125246): Use `<outputDirectory/>` instead of
	`<outputDirectory></outputDirectory>` to avoid the following error:
	`[WARNING] The assembly descriptor contains a filesystem-root relative reference,
	which is not cross platform compatible /` (note that omitting it altogether will result in the source path
	being used)
	
* [depdendency](http://maven.apache.org/plugins/maven-dependency-plugin/)
* [resources](http://maven.apache.org/plugins/maven-resources-plugin/)
* [com.spotify:docker-maven-plugin](https://github.com/spotify/docker-maven-plugin) -
  [BuildMojo.java](https://github.com/spotify/docker-maven-plugin/blob/master/src/main/java/com/spotify/docker/BuildMojo.java)
  [Maven central](http://search.maven.org/#search%7Cgav%7C1%7Cg%3A%22com.spotify%22%20AND%20a%3A%22docker-maven-plugin%22)

    mvn com.spotify:docker-maven-plugin:0.2.11:help -Ddetail=true

* [org.codehaus.mojo:exec-maven-plugin](http://www.mojohaus.org/exec-maven-plugin/)
* `mvn help:system` - show system properties and environment variables that Maven will use.

## Copy a dependency locally

[mvn:dependency-copy](http://maven.apache.org/plugins/maven-dependency-plugin/copy-mojo.html) ([SO](http://stackoverflow.com/a/26676996/125246)):

```sh
mvn dependency:copy "-Dartifact=${ARTIFACT_COORD}" \
    -Dmdep.overWriteSnapshots=true \
    -Dmdep.overWriteReleases=true \
    -Dmdep.useBaseVersion=true \
    -Dmdep.stripVersion=flase \
    -Dmdep.stripClassifier=true \
    "-DoutputDirectory=${TEMP_DIR}"
```

or unpack using [mvn:dependency-unpack](http://maven.apache.org/plugins/maven-dependency-plugin/unpack-mojo.html) ([usage](https://maven.apache.org/plugins/maven-dependency-plugin/usage.html), [examples](https://maven.apache.org/plugins/maven-dependency-plugin/examples/unpacking-artifacts.html)):

```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-dependency-plugin</artifactId>
    <version>2.10</version>
    <executions>
        <execution>
            <id>unpack-ebdc-mc-content</id>
            <phase>generate-resources</phase>
            <goals>
                <goal>unpack</goal>
            </goals>
            <configuration>
                <artifactItems>
                    <artifactItem>
                        <groupId>my.groupid</groupId>
                        <artifactId>my-artifactid</artifactId>
                        <version>1.2.3-SNAPSHOT</version>
                        <type>jar</type>
                        <overWrite>false</overWrite>
                        <outputDirectory>src/main/webapp/WEB-INF</outputDirectory>
                        <excludes>META-INF/**</excludes>
                    </artifactItem>
                </artifactItems>
                <overWriteReleases>false</overWriteReleases>
                <overWriteSnapshots>true</overWriteSnapshots>
            </configuration>
        </execution>
    </executions>
</plugin>
```

## Workarounds

### Don't fail if there are Java 8 Javadoc errors

Java 8 causes builds to fail if there are Javadoc (lint) errors.  To avoid this:
[ref](http://blog.joda.org/2014/02/turning-off-doclint-in-jdk-8-javadoc.html),
[example](https://github.com/dropwizard/dropwizard/blob/master/pom.xml)

```xml
<!-- Add a profile to detect Java 8 -->
<profile>
  <id>java8-disable-strict-javadoc</id>
  <activation>
    <jdk>[1.8,)</jdk>
  </activation>
  <properties>
    <javadoc.doclint.none>-Xdoclint:none</javadoc.doclint.none>
  </properties>
</profile>

<!-- Then pass this to Javadoc -->
<plugin>
  <groupId>org.apache.maven.plugins</groupId>
  <artifactId>maven-javadoc-plugin</artifactId>
  <version>2.10.1</version>
  <configuration>
    <additionalparam>${javadoc.doclint.none}</additionalparam>
    <quiet>true</quiet>
  </configuration>
</plugin>
```

### Speed up slow dependency report
Maven dependencies will by default try calling each repository to see if each dependency is found there.  That can take a while!  It will also examine each Jar to get statistics about number of classes, etc. which seems unnecessary.  To disable both ([ref](http://whatiscomingtomyhead.wordpress.com/2011/04/20/if-your-maven-site-build-is-too-slow/)):
```xml
<reporting>
  <plugins>
      <plugin>
          <groupId>org.apache.maven.plugins</groupId>
          <artifactId>maven-project-info-reports-plugin</artifactId>
          <version>2.4</version>
          <configuration>
              <!-- Speed up dependency plugin -->
              <dependencyDetailsEnabled>false</dependencyDetailsEnabled>
              <dependencyLocationsEnabled>false</dependencyLocationsEnabled>
          </configuration>
      </plugin>
  </plugins>
</reporting>
```

## Optimising POMs

Analyse dependencies (look for unused)
```sh
# Output as XML
mvn dependency:analyze -DoutputXML=true
mvn dependency:analyze-duplicate
```

Check for updated dependencies and plugins
```sh
mvn versions:display-dependency-updates
mvn versions:display-plugin-updates
mvn versions:display-property-updates
mvn versions:use-latest-releases
```

## Maven project versions

[POM Syntax](http://books.sonatype.com/mvnref-book/reference/pom-relationships-sect-pom-syntax.html):

```
<major version>.<minor version>.<incremental version>-<qualifier>
# or
<major version>.<minor version>.<incremental version>-<qualifier>-<build number>
```

Use [`build-helper:parse-version`](http://www.mojohaus.org/build-helper-maven-plugin/parse-version-mojo.html) to get parts of the version ([SO](http://stackoverflow.com/a/38223890/125246)):

```sh
POM_VERSION_QUALIFIER=version=$(printf 'VER\t${parsedVersion.qualifier}\n' | \
    mvn org.codehaus.mojo:build-helper-maven-plugin:1.11:parse-version \
        org.apache.maven.plugins:maven-help-plugin:2.1.1:evaluate | \
    grep '^VER' | cut -f2)
```

* `[propertyPrefix].majorVersion`, `[propertyPrefix].minorVersion`, `[propertyPrefix].incrementalVersion`,
  `[propertyPrefix].qualifier`, `[propertyPrefix].buildNumber`

Or for the project version:

```bash
printf 'VERSION\t${project.version}\n0\n' | \
        mvn org.apache.maven.plugins:maven-help-plugin:2.1.1:evaluate | \
        grep '^VERSION' | \
        cut -f2 > target/maven.version
```

From Maven 3.2, [ComparableVersions](https://maven.apache.org/ref/3.3.3/maven-artifact/apidocs/org/apache/maven/artifact/versioning/ComparableVersion.html) are used which are looser ([SO](http://stackoverflow.com/a/31482463/125246)):

* Separators can be '-', '.', and transition between characters and digits (but are ignored when comparing for equality)
* Unlimited number of version components (text or strings)
* Well-known qualifiers come before custom: `alpha` or `a`, `beta` or `b`, `milestone` or `m`, `rc` or `cr`, `snapshot`, empty string or `ga` or `final`, `sp`
* A dash usually precedes a qualifier and is always less important that something preceded with a dot (creates a sublist).

## Client configuration

* [Server password encryption](https://maven.apache.org/guides/mini/guide-encryption.html) (for repositories)

## Nexus Notes

* [2.11 docs](http://books.sonatype.com/nexus-book/2.11/reference/index.html)

## Maven site errors

Cannot download parent POM's site descriptor:

```
Failed to execute goal org.apache.maven.plugins:maven-site-plugin:3.4:effective-site (default-cli) on project ...
Unable to locate site descriptor: Could not transfer artifact org.springframework.boot:spring-boot-starter-parent:xml:site_en:1.2.5.RELEASE from/to internal.repo 
...
Return code is: 500 , ReasonPhrase:Unable to fetch artifact resource..
```

Check that the site descriptor is actually being retrieved.
Try disabling the use of an internal repository, and access Maven Central directly (worked for me - Archiva v1.3.5 does not seem to fetch site descriptors).

## Run Ant tasks in a Maven build with [antrun](http://maven.apache.org/plugins/maven-antrun-plugin/)

```xml
<plugin>
	<artifactId>maven-antrun-plugin</artifactId>
	<version>1.8</version>
	<executions>
	    <!-- Generate configuration for all environments -->
	    <execution>
	        <id>generate-config</id>
	        <phase>compile</phase>
	        <goals>
	            <goal>run</goal>
	        </goals>
	        <configuration>
	            <tasks>
	                <ant dir="${project.basedir}/src/config" useNativeBasedir="true"/>
	            </tasks>
	        </configuration>
	    </execution>
	</executions>
</plugin>
```

## Copy and unpack a file and verify its signature

[download-maven-plugin](http://maven-download-plugin.github.io/maven-download-plugin/docsite/1.3.0/wget-mojo.html) Also caches downloaded files. ([SO](http://stackoverflow.com/a/19152358/125246))

```xml
<plugin>
  <groupId>com.googlecode.maven-download-plugin</groupId>
  <artifactId>download-maven-plugin</artifactId>
  <version>1.3.0</version>
  <executions>
    <execution>
	<id>download-tomcat</id>
	<phase>prepare-package</phase>
	<goals>
	    <goal>wget</goal>
	</goals>
	<configuration>
	    <url>${tomcat.url}</url>
	    <unpack>true</unpack>
	    <outputDirectory>${project.build.directory}/tomcat-raw</outputDirectory>
	    <sha1>${tomcat.sha1}</sha1>
	</configuration>
    </execution>
  </executions>
</plugin>
```

## Use a different JDK to compile

* <https://maven.apache.org/plugins/maven-compiler-plugin/examples/compile-using-different-jdk.html>

## Duplicate classes

* [JBoss Tattletale](http://tattletale.jboss.org/) - standalone tool
* [duplicate-finder-maven-plugin](https://github.com/basepom/duplicate-finder-maven-plugin)