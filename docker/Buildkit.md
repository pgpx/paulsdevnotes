# Buildkit

* [https://www.giantswarm.io/blog/container-image-building-with-buildkit](https://www.giantswarm.io/blog/container-image-building-with-buildkit)

Use remote caches of Docker layers:

```bash
DOCKER_BUILDKIT=1 docker build --pull \
        --tag "$TAG" \
        --build-arg BUILDKIT_INLINE_CACHE=1 \
        --cache-from "$TAG" .
```

# k8s Installation

Try:

* <https://github.com/estesp/buildkit-cluster-example>
* <https://medium.com/nttlabs/buildx-kubernetes-ad0fe59b0c64>
* <https://www.slideshare.net/AkihiroSuda/dockercon2019-deploying-rootless-buildkit-on-kubernetes>