# Docker Registry

## Registries

* [Harbour](https://goharbor.io/) - quite comprehensive, with UI, scanning, etc. - [Docs](https://goharbor.io/docs/), [GitHub](https://github.com/goharbor/harbor), [Helm](https://artifacthub.io/packages/helm/harbor/harbor)

## Caching registry

DockerHub now has pull-limits on free accounts.

* <https://github.com/ministryofjustice/cloud-platform-docker-registry-cache>

## APIs

* Google [go-containerregistry](https://github.com/google/go-containerregistry) - golang library for working with container registries (used by Kaniko)
* Google [containerregistry](https://github.com/google/containerregistry) - Python libraries and tools for interacting with a Docker Registry.

## Cleanup

* Deleting an image in the standard Docker registry does not delete the underlying blob because eventual consistency is hard (across storage providers)!
  
    * ([Issue discussion and comment](https://github.com/distribution/distribution/issues/422#issuecomment-95745774), and also [immutable tags issue](https://github.com/distribution/distribution/issues/46), [ soft deletes of manifests and blobs through the Registry HTTP API](https://github.com/distribution/distribution/issues/461), [Implement asynchronous cleanup of unreferenced blob data](https://github.com/distribution/distribution/issues/462), [Garbage Collection PR](https://github.com/distribution/distribution/pull/1386))
    
    * [CNCF distribution architecture doc on eventual consistency](https://github.com/distribution/distribution/blob/main/docs/architecture.md#eventual-consistency)