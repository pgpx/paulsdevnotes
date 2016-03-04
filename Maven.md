# Maven Notes

* [POM descriptor reference](http://maven.apache.org/ref/3-LATEST/maven-model/maven.html)
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

## Profiles

* [Maven reference](https://books.sonatype.com/mvnref-book/reference/profiles.html)

Run with selected profiles:

```bash
mvn compile -Pprofile1,profile2
```

List active profiles ([ref](https://books.sonatype.com/mvnref-book/reference/profiles-sect-listing-active-profiles.html):

```bash
mvn help:active-profiles`
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
<property>
  <name>sparrow-type</name>
  <value>African</value>
</property>
<file>
  <exists>${basedir}/file2.properties</exists>
  <missing>${basedir}/file1.properties</missing>
</file>
```

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
