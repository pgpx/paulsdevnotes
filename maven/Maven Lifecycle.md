# Maven Lifecycle

* [Lifecycle reference](https://maven.apache.org/ref/3.5.4/maven-core/lifecycles.html)
* [Introduction to the Build Lifecycle](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html)

## Analysis Plugins

* [buildplan-maven-plugin](http://buildplan.jcgay.fr/) ([SO](https://stackoverflow.com/a/35610377/125246)) - lists lifecycle phases and the associated plugins.

    ```bash
    mvn fr.jcgay.maven.plugins:buildplan-maven-plugin:list -Dbuildplan.tasks=clean,deploy
    ```