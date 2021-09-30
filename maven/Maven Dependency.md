# Maven Dependency

* Copy a dependency to the local filesystem:
    
    ```bash
    # Strip version, because it might be given as RELEASE or LATEST but the resolved dependency will have the real
    # version number (which we would not be told)
    
    mvn dependency:copy "-Dartifact=groupid:artifactid:version:packaging:classifier" \
        -Dmdep.overWriteSnapshots=true \
        -Dmdep.overWriteReleases=true \
        -Dmdep.useBaseVersion=true \
        -Dmdep.stripVersion=true \
        -Dmdep.stripClassifier=true \
        "-DoutputDirectory=${TARGET}"
    ```

* Show the dependency tree:

    ```
    mvn dependency:tree
    ```
    
    Or if that gives errors ([SO](https://stackoverflow.com/a/16694049/125246)):
    
    ```
    mvn dependency:tree --debug
    ```
  
## go-offline

Copy all dependencies and plugins to prepare for an offline build (e.g. as the first `RUN` command in a Docker build, to enable caching).

[dependency:go-offline](http://maven.apache.org/plugins/maven-dependency-plugin/go-offline-mojo.html) works, but misses lots of dependencies:

```dockerfile
RUN mvn dependency:go-offline -B
```

[qaware/go-offline-maven-plugin](https://github.com/qaware/go-offline-maven-plugin) copies most of them:

```dockerfile
RUN mvn de.qaware.maven:go-offline-maven-plugin:1.2.8:resolve-dependencies -B
```