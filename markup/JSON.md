# JSON

## JSON Schema

* <https://json-schema.org/understanding-json-schema/>

## jq

* [GitHub](https://github.com/stedolan/jq), [DockerHub](https://hub.docker.com/r/stedolan/jq)

CLI to manipulate JSON files

Set a nested property:

```bash
jq "setpath([\"auths\", \"${CACHE_REGISTRY}\"]; {\"auth\":\"${encoded}\"})"
```

Get values from a list ([SO](https://stackoverflow.com/a/45524015/125246):

```bash
.response[].text
```

### Docker single-file build

([ref](https://github.com/wesley-dean-flexion/busybox-jq-latest/blob/master/Dockerfile))

```dockerfile
FROM alpine:3.14.0 AS builder
WORKDIR /workdir
RUN apk update && apk add --no-cache git autoconf automake libtool build-base
RUN git clone https://github.com/stedolan/jq.git
WORKDIR /workdir/jq
RUN git submodule update --init && autoreconf -fi && ./configure --disable-docs --disable-maintainer-mode --with-oniguruma && make -j8 LDFLAGS=-all-static && strip jq
```
