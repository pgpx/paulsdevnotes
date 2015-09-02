# Maven Notes

* [POM descriptor reference](http://maven.apache.org/ref/3-LATEST/maven-model/maven.html)
* [Maven Central search](http://search.maven.org/)
* [Lifecycle Reference](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html#Lifecycle_Reference)

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
## Client configuration

* [Server password encryption](https://maven.apache.org/guides/mini/guide-encryption.html) (for repositories)

## Nexus Notes

* [2.11 docs](http://books.sonatype.com/nexus-book/2.11/reference/index.html)
