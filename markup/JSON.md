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

Escape keys - enclose in double-quotes ([SO](https://stackoverflow.com/a/37344498/125246)): `jq '."component-status"'`

Filter:

```bash
jq '.deployment.resources[] | select ( .parent == "urn:pulumi:oc-dev::pulumi-aws::kubernetes:helm.sh/v3:Chart::test-redis" ) | .urn '  my.json
```

JSON-encode ([SO](https://stackoverflow.com/a/50380697/125246))

```bash
$ echo -n '猫に小判' | jq -aRs .
"\u732b\u306b\u5c0f\u5224"
```

JSON-decode:

```bash
echo -n '"str"' | jq -r .
```

Combine lists ([SO](https://stackoverflow.com/a/42013459/125246)):

```bash
$ jq 'reduce inputs as $i (.; .list += $i.list)' blahblah.json blueblue.json
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
