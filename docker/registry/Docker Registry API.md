# Docker Registry API

* [Docker Registry HTTP API V2](https://docs.docker.com/registry/spec/api/#listing-image-tags)

## [API Version check](https://docs.docker.com/registry/spec/api/#api-version-check)

`GET /v2/` - returns `200 OK` if successful (or `401 Unauthorized` or `404 Not Found`)

## Docker Hub

* <https://stackoverflow.com/a/57579982/125246>
    * service: `registry.docker.io`
    * authentication API URL: `https://auth.docker.io/token?...`
    * manifest API URL: `https://registry-1.docker.io/v2/...`
    * Reverse-engineered using [mitmproxy](https://mitmproxy.org/)
  