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

## Open issues

* [signatures support?](https://github.com/GoogleContainerTools/kaniko/issues/749)