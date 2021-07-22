# alpine

Minimal O/S

* [DockerHub](https://hub.docker.com/_/alpine)

Install a package:

```Dockerfile
RUN apk add --no-cache mysql-client
```

* Note that `apk add --no-cache` updates its index on-the-fly, so you don't need either of `--update` or `rm -rf /var/cache/apk/*` ([ref](https://github.com/gliderlabs/docker-alpine/blob/master/docs/usage.md))