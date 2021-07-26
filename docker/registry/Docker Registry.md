# Docker Registry

* [Docs](https://docs.docker.com/registry/), [distribution/distribution GitHub](https://github.com/distribution/distribution), [DockerHub](https://hub.docker.com/_/registry)
* [Docker Registry UI](https://github.com/Joxit/docker-registry-ui) - a simple and complete user interface for your private docker registry.  Also similarly <https://github.com/Quiq/docker-registry-ui>

## Configuration

* <https://docs.docker.com/registry/configuration/>

Default config file `/etc/docker/registry/config.yml`:

```yaml
version: 0.1
log:
  fields:
    service: registry
storage:
  cache:
    blobdescriptor: inmemory
  filesystem:
    rootdirectory: /var/lib/registry
http:
  addr: :5000
  headers:
    X-Content-Type-Options: [nosniff]
health:
  storagedriver:
    enabled: true
    interval: 10s
    threshold: 3
```

## Garbage collection

* <https://docs.docker.com/registry/garbage-collection/>

`registry garbage-collect /etc/docker/registry/config.yml`