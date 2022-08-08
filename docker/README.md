# [Docker](https://www.docker.com/) notes

* [Dockerfile ref](https://docs.docker.com/reference/builder/)

Tools
* [Skopeo](https://github.com/containers/skopeo) - query Docker images and repositories
* [ctop](https://github.com/bcicen/ctop) - Top-like interface for container metrics
* [dazzle](https://github.com/gitpod-io/dazzle) - dazzle is a rather experimental Docker/OCI image builder. Its goal is to build independent layers where a change to one layer does not invalidate the ones sitting "above" it.

Books
* [Docker + Consul](https://www.safaribooksonline.com/library/view/docker-in-the/9781939902184/ch15.html#idp6134288)

Links
* [Explaining Docker Image IDs](https://windsock.io/explaining-docker-image-ids/)
* <http://stackengine.com/the-definitive-guide-to-docker-free-and-open-source-tools/>
* <https://www.databasesandlife.com/docker-build-pull-option/>

* [Docker Tagging: Best practices for tagging and versioning docker images](https://blogs.msdn.microsoft.com/stevelasker/2018/03/01/docker-tagging-best-practices-for-tagging-and-versioning-docker-images/)
* <https://medium.com/@tariq.m.islam/container-deployments-a-lesson-in-deterministic-ops-a4a467b14a03>
* <https://jpetazzo.github.io/2020/03/01/quest-minimal-docker-images-part-2/>

Best practices
* Google Cloud Architecture Center - [Best practices for building containers](https://cloud.google.com/architecture/best-practices-for-building-containers#carefully_consider_whether_to_use_a_public_image)

Interesting related projects:

* [DockerSlim](https://github.com/docker-slim/docker-slim) (docker-slim): Don't change anything in your Docker container image and minify it by up to 30x (and for compiled languages even more) making it secure too! (free and open source) <https://dockersl.im>
* [Hadolint](https://github.com/hadolint/hadolint) - Dockerfile linter
* [orca-build](https://github.com/cyphar/orca-build) - allows you to build OCI images from a Dockerfile or Orcafile. It doesn't require a daemon or root privileges to operate.  Python wrapper around [umoci](https://github.com/openSUSE/umoci), [runC](https://github.com/opencontainers/runc), [skopeo](https://github.com/containers/skopeo)
* [Testcontainers](https://www.testcontainers.org/) - Java library that supports JUnit tests, providing lightweight, throwaway instances of common databases, Selenium web browsers, or anything else that can run in a Docker container.
  * [Testcontainers Port Updater](https://github.com/yusufugurozbek/testcontainers-port-updater) - automatically updates the IntelliJ data source port number with the exposed random port number that Testcontainers chose on startup.

## Installation
Mac (with Brew and Cask):
```sh
brew cask install dockertoolbox
```

* [Experimental features](https://github.com/docker/cli/tree/master/experimental#docker-experimental-features):

    Start the Docker daemon with `--experimental` or put the following in `/etc/docker/daemon.json` (or tick `Experimental features` in Docker Desktop -> Preferences... -> Daemon -> Basic):

    ```json
    {
        "experimental": true
    }
    ```
    Check to see if they have been enabled: `docker version -f '{{.Server.Experimental}}'`

## Commands

*  [`build`](https://docs.docker.com/reference/commandline/build/)
*  [`run`](https://docs.docker.com/reference/run/) [(cmd-ref)](https://docs.docker.com/reference/commandline/run/)

```bash

docker ps -a
docker start cb2_db_1 cb2_web_1
docker --help
# without tail it will output all existing log entries!
docker logs -f --tail=100 cb2_web_1

docker search <string> # Search for a container on the Docker Hub Registry

docker pull <username>/<repository> # Download an image from Docker Hub Registry

#Start a container by running a process in it (and container stops when process stops):
docker run <image name> <command>
#e.g. docker run learn/tutorial echo "hello world"
docker run learn/tutorial apt-get install -y ping
docker run -t -i ubuntu:14.04 /bin/bash
```

Run arguments:
* -d - daemon (run in background)
* -P - map container ports to high ports of host
* -p <container-port>:<host-port> - map specific ports
* -i - interactive
* -t - allocate a pseudo tty
** --name <name> - choose a unique name for the container
* --rm - delete the container once it is stopped
* -w=<workdir> - override the working directory
* -v=$(pwd)/dir:/containerdir - Mount a directory on the host as a volume

Linking containers
Secure and private - only linked containers can talk to each other.

* --link <name>:<alias>

    docker run -d -P --name web --link db:db training/webapp python app.py

Linked containers get environment variables and an entry in /etc/hosts
```
DB_NAME=/insane_mclean/db
DB_PORT_5432_TCP_ADDR=172.17.0.15
DB_PORT=tcp://172.17.0.15:5432
DB_PORT_5432_TCP=tcp://172.17.0.15:5432
DB_PORT_5432_TCP_PORT=5432
DB_PORT_5432_TCP_PROTO=tcp
DB_ENV_PG_VERSION=9.3
```

/etc/hosts:

    172.17.0.15     db

[Cleanup stopped containers](http://sosedoff.com/2013/12/17/cleanup-docker-containers-and-images.html)

    docker rm $(docker ps -a -f status=exited -q)

Cleanup dangling images (Not referenced by a tagged image)

    docker rmi $(docker images --filter dangling=true -q)

But don't do this while another pull is happening: https://github.com/docker/docker/pull/13681

But unsafe if also pulling:
* https://github.com/docker/docker/issues/8926
* http://jimhoskins.com/2013/07/27/remove-untagged-docker-images.html

Show port mappings

    docker port <container-id>

Find the ID of a container: `docker ps -l`

Save changes to a container by committing (saves diff between old and new state)

    docker commit <first-part-of-container-id> <new name>

get back new image ID

Can then use that new container image:

    docker run learn/ping ping www.google.com

See running containers

    docker ps
    docker ps -l # Latest container:
    docker ps -a # All containers including stopped

Inspect running container

    docker inspect <first-part-of-container-id>

List images currently installed on host

    docker images
    
Show the size of each image layer ([ref](https://forums.docker.com/t/how-can-i-see-the-size-of-a-image-layer/3422))

     docker history <image name>

Push an image to DockerHub

    docker push <username>/<image>

[Install on Ubuntu](https://docs.docker.com/installation/ubuntulinux/)

Logs

    docker logs <container-id>
    docker logs -f <container-id> # Follow

Stop a container

    docker stop <container-id>

Delete a container

    docker rm <container-id> 

Delete stopped containers with the specfied name prefix:

    ```bash
    docker container ls -a --filter "name=runner-.*" --filter "status=exited" -q | xargs docker rm
    ```

Create a new image

    docker commit -m=“Comment" -a=“Author” <container-id> <username>/<image-name>:v<version-number>
    docker commit -m="Added json gem" -a="Kate Smith" 0b2616b0e5a8 ouruser/sinatra:v2

Tag an image

    docker tag <image-id> <username>/<image-name>:<tag>
    docker tag 99cdb05473d6 paulm/sinatra:devel

Examples

    docker run --name testdb -p 3306:3306 \
        -e MYSQL_ROOT_PASSWORD=password -e MYSQL_USER=henry \
        -e MYSQL_PASSWORD=henrypwd -e MYSQL_DATABASE=henryee \
        -d mysql:5.6

Run commands in a container using a user/group with the same uid:gid as the host, by dynamically creating that user:

```sh
docker run --rm -v $(pwd)/build/jenkins:/home/jenkins my-image \
    bash -c "addgroup --gid $(id -g $USER) $USER ;
        useradd --uid $(id -u $USER) --gid $(id -g $USER) jenkins ;
        su jenkins -c 'mvn  clean compile test source:jar javadoc:jar deploy'"
```

Add a host mapping when running a container:

```sh
docker run --add-host my-host:10.40.200.123 ...
```

Show Docker disk usage with [docker system df](https://docs.docker.com/engine/reference/commandline/system_df/):

```sh
# Aggregated
docker system df

# Verbose (per-container, image, and volume)
docker system df --verbose
```


## [Dockerfile](https://docs.docker.com/reference/builder/)

Create a file called `Dockerfile` in a directory.
That directory becomes the 'context' of the build (for source files, etc).

`.dockerignore` - exclude files and directories (syntax: http://golang.org/pkg/path/filepath/#Match)
```
# Ignore a file in the same directory as the Dockerfile
# (no leading /)
run.sh

# Ignore a directory (trailing /)
BUILD/
```

    sudo docker build -t myname/myapp .

Dockerfile syntax:

Each instruction runs independently (so "RUN cd /tmp" will have no effect) and causes a new image to be created. 

First line defines required Docker version

```
# DOCKER-VERSION 1.2.0
# Comments
# Parent image or image:tag
FROM centos:centos6

# Set author field of generated images
MAINTAINER <name>

# Run a command in a shell (/bin/sh -c)
RUN <command>

# Exec form (avoids string munging, and doesn't need /bin/sh in the base image)
RUN ["executable", "param1", "param2"]

# Cache for run instructions isn't automatically invalidated for the next build; to do so use docker build --no-cache

# Only one CMD per Dockerfile.
# Provides defaults for an executing container

# Set the command to be executed when running the image.
# Preferred form, like an exec
CMD ["executable","param1","param2"]

# as a shell (in /bin/sh -c)
CMD command param1 param2


# as default parameters to ENTRYPOINT
CMD ["param1","param2"]

# Network ports the container will listen on at runtime
EXPOSE <port> [<port>...]

# Set an environment variable, passed to all future RUN instructions; equivalent to prefixing commands with <key>=<value>
# Will persist when container is run.  Can be viewed with docker inspect, and changed with docker run --env <key>=<value>
ENV <key> <value>

# Copy new files/directories (or unpacked archives) from the context or a URL to an absolute path in the container.  Created with a UID and GID of 0.
ADD <src> <dest>

# Like ADD except archives aren't unpacked?
COPY <src> <dest>

# Only 1 per dockerfile.
# Like CMD, except that the command will not be overwritten when arguments are passed to docker run.
# e.g. can "docker run <image> -d" to pass -d argument to the entry point.
# Can also use CMD array to specify additional arguments that will get overwritten by arguments on the command line.
ENTRYPOINT ["executable", "param1", "param2"] (like an exec, the preferred form)
ENTRYPOINT command param1 param2 (as a shell)

# Create a mount point (holding externalkly mounted volumes from the host or other containers)
VOLUME ["/data"]
VOLUME /var/log

# Sets the user name or UID to use when running the image and subsequent RUN directives
USER daemon

# Set the working directory for RUN, CMD, ENTRYPOINT that follow it
WORKDIR /path/to/workdir
WORKDIR relative/to/prev/workdir

# Adds a trigger instruction to be executed when the image is used as the base of another (FROM command).
#  e.g. copy application source code using a reusable application builder (source code won't be available in the base image).
ONBUILD [INSTRUCTION]
```


## Compose


## Machine

* [CLI](https://docs.docker.com/compose/cli/), [YML](https://docs.docker.com/compose/yml/)
* [Docs](https://docs.docker.com/machine/), [Github](https://github.com/docker/machine)

## Boot2docker
(Legacy)

```bash
boot2docker up
boot2docker status
boot2docker ip # Docker’s IP
```

## Tips

### Permissions on files created in mounted volumes

Docker will create files with a uid/gid based on the user in the container, which might not match those in the host.

Possible solutions ([SO](http://stackoverflow.com/questions/26500270/understanding-user-file-ownership-in-docker-how-to-avoid-changing-permissions-o)):

* Change the permissions of files in the container to match those of the root directory of the volume, e.g.

```bash
chown -R `stat -c "%u:%g" /shared` /shared
```

* `run -u` so all files created will automatically have the correct owner (but you won't be running as root in the container, unless you add that user to the root group)

```bash
docker run -v `pwd`/shared:/shared -u `stat -c "%u:%g /shared` ubuntu bash
```
## Users

* [Understanding how uid and gid work in Docker containers](https://medium.com/@mccode/understanding-how-uid-and-gid-work-in-docker-containers-c37a01d01cf)