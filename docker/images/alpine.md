# alpine

Minimal O/S

* [DockerHub](https://hub.docker.com/_/alpine)

Install a package:

```Dockerfile
RUN apk add --no-cache mysql-client
```

* Note that `apk add --no-cache` updates its index on-the-fly, so you don't need either of `--update` or `rm -rf /var/cache/apk/*` ([ref](https://github.com/gliderlabs/docker-alpine/blob/master/docs/usage.md))

Create a user: ([SO](https://stackoverflow.com/a/49955098/125246), [ref](https://wiki.alpinelinux.org/wiki/Setting_up_a_new_user))

```Dockerfile
FROM alpine:latest

# Create a group and user
RUN addgroup --group appgroup && adduser --ingroup appgroup appuser

# Tell docker that all future commands should run as the appuser user
USER appuser
```

Add a system group/user with `-S`
* System users are a like normal users but for are set an organizational purpose. The only difference is: They don't have an expiry date ( no aging set ), Their uids are below 999 like set on /etc/login.defs (can be changed)  ([SO](https://unix.stackexchange.com/a/619657/32390))