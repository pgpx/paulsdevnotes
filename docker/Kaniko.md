# Kaniko

* <https://github.com/GoogleContainerTools/kaniko>

Docker image builder from Google.

* Docker image [Tags](https://console.cloud.google.com/gcr/images/kaniko-project/GLOBAL/executor?gcrImageListsize=30)

Code
* [Dockerfile_debug](https://github.com/GoogleContainerTools/kaniko/blob/master/deploy/Dockerfile_debug)

## GitLab

* [Use kaniko to build Docker images in GitLab](https://docs.gitlab.com/ee/ci/docker/using_kaniko.html)

## Caching

* [Using Kaniko cache](https://cloud.google.com/build/docs/kaniko-cache) (in GCR)
* <https://github.com/GoogleContainerTools/kaniko#caching-base-images>
* <https://stackoverflow.com/questions/60138258/share-kaniko-cache-for-multi-stage-docker-builds-with-cloudbuild>
* [Code fragment for cleaning cached images in GCR](https://github.com/GoogleContainerTools/kaniko/issues/1402)
* `--cache-copy-layers` does not work for multi-stage builds ([issue](https://github.com/GoogleContainerTools/kaniko/issues/2065))

## Secrets

Docker Buildkit supports `--secret` to pass secret values into the build (without storing them in the image), e.g. `--secret id=gitconfig,src=$HOME/.gitconfig`.

Kaniko doesn't support this, with the only way to pass secret values into the build (without storing them in the image) is to copy them into `/kaniko` - they'll then be accessible within the build but not saved to the image ([related issue](https://github.com/GoogleContainerTools/kaniko/issues/1505) and [another issue](https://github.com/GoogleContainerTools/kaniko/issues/489)).

## Open issues

* [signatures support?](https://github.com/GoogleContainerTools/kaniko/issues/749)
* [Missing or partial support for pattern substition in variable references (e.g. in RUN)](https://github.com/GoogleContainerTools/kaniko/issues/1246)
* [Files created within kaniko can be partially accessed in Dockerfile](https://github.com/GoogleContainerTools/kaniko/issues/1553)