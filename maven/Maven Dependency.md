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