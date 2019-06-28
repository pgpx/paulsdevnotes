# Alpine Linux

* <https://alpinelinux.org/>
* <https://wiki.alpinelinux.org/wiki/Main_Page>
* Docker image: <https://hub.docker.com/_/alpine/>

## Installing packages

* <https://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management>

```bash
apk add --no-cache openssh openntp vim
```

* Note that `apk add --no-cache` updates its index on-the-fly, so you don't need either of `--update` or `rm -rf /var/cache/apk/*` ([ref](https://github.com/gliderlabs/docker-alpine/blob/master/docs/usage.md))