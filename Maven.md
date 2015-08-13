# Maven Notes

* [POM descriptor reference](http://maven.apache.org/ref/3-LATEST/maven-model/maven.html)
* [Maven Central search](http://search.maven.org/)
* [Lifecycle Reference](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html#Lifecycle_Reference)

## Plugins

* [Main Index](http://maven.apache.org/plugins/index.html),
  [Codehaus MojoHaus Index](http://www.mojohaus.org/plugins.html)
  ([Github](https://github.com/mojohaus))
* [assembly](http://maven.apache.org/plugins/maven-assembly-plugin/) -
  [goals](http://maven.apache.org/plugins/maven-assembly-plugin/plugin-info.html)
  
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

## Nexus Notes

* [2.11 docs](http://books.sonatype.com/nexus-book/2.11/reference/index.html)
