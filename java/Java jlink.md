# Java jlink

Produce a minimal JRE (with only selected modules) to enable smaller Docker images (and native executables) to be produced.

* <https://medium.com/azulsystems/using-jlink-to-build-java-runtimes-for-non-modular-applications-9568c5e70ef4>
* <https://www.devdungeon.com/content/how-create-java-runtime-images-jlink>


Identify dependencies (will not work on Java 11):

```bash
jdeps --multi-release 11 target/*.jar

# or with a later JDK (will probably get NPE in Java 11)
jdeps --print-module-deps --multi-release 11 target/*
```

Use jlink to generate a JRE:

```bash
jlink --no-header-files --no-man-pages --compress=2 --strip-debug --output java-runtime4 --add-modules java.base,java.logging,java.naming,java.security.jgss,java.xml
```

## Java 11

Extra steps need to be performed to get Java 11 Jlink-produced images to work (Java 15 doesn't seem to have these issues)

* [Java 11 in Alpine Linux containers](https://blog.gilliard.lol/2018/11/05/alpine-jdk11-images.html)
* <https://stackoverflow.com/questions/53669151/java-11-application-as-lightweight-docker-image>

  If you try to run a jlink Java 11 image on Alpine, you'll just get `.../bin/java: not found`

    Alpine uses [musl](https://www.musl-libc.org/) instead of [libc](https://www.gnu.org/software/libc/), but Java typically requires libc.
    
    [Project Portola](https://openjdk.java.net/projects/portola/) is in development - The goal of this Project is to provide a port of the JDK to the Alpine Linux distribution, and in particular the musl C library.
    
    [AdoptOpenJdk](https://adoptopenjdk.net/) build Alpine images using a [glibc package for Alpine Linux](https://github.com/sgerrand/alpine-pkg-glibc) - you can copy steps from their Dockerfile.