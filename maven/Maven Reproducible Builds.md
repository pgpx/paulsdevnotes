# Maven Reproducible Builds

* <https://reproducible-builds.org/> - promise identical results from a given source - deterministic, and ensure no vulnerabilities have been adedd.mvn enforcer:display-info
* Maven guide [Configuring for Reproducible Builds](https://maven.apache.org/guides/mini/guide-reproducible-builds.html)
    * Describes how plugins need to be upgraded and `project.build.outputTimestamp` set.
    * [Wiki page](https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=74682318)
* [Maven Git Versioning Extension support](https://github.com/qoomon/maven-git-versioning-extension#reproducible-builds)
    ```xml
    <project.build.outputTimestamp>${git.commit.timestamp.datetime}</project.build.outputTimestamp>
    ```
* Debian related [wiki page](https://wiki.debian.org/ReproducibleBuilds/BuildinfoFiles)
  
This allows Maven-based Docker builds to generate the same image.
* Need to set timestamps otherwise Docker builds will not generate the same image (at least on GitLab CI).