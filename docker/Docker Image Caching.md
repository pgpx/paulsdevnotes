# Docker Image Caching

* `cache-from` might not work for multiple stages: [issue](https://github.com/moby/moby/issues/34715)

## Caching using BuildKit

* <https://docs.docker.com/engine/reference/commandline/build/#specifying-external-cache-sources>
* <https://testdriven.io/blog/faster-ci-builds-with-docker-cache/>

```bash
DOCKER_BUILDKIT=1 docker build ${DOCKER_BUILD_OPTS:-} \
      --build-arg BUILDKIT_INLINE_CACHE=1 \
      --cache-from=my-image:version ...
```
