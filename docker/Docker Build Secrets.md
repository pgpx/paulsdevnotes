# Docker Build Secrets

* <https://docs.docker.com/develop/develop-images/build_enhancements/#new-docker-build-secret-information>

Secret files that can be mounted at build-time, but that do not get stored in the image at all (build-args do).

```dockerfile
# syntax = docker/dockerfile:1.0-experimental
FROM alpine

# shows secret from default secret location:
RUN --mount=type=secret,id=mysecret cat /run/secrets/mysecret

# shows secret from custom secret location:
RUN --mount=type=secret,id=mysecret,dst=/foobar cat /foobar
```

Needs to be built via buildkit:

```bash
DOCKER_BUILDKIT=1 docker build --no-cache --progress=plain --secret id=mysecret,src=mysecret.txt .
```