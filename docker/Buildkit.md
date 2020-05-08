# Buildkit

Use remote caches of Docker layers:

```bash
DOCKER_BUILDKIT=1 docker build --pull \
        --tag "$TAG" \
        --build-arg BUILDKIT_INLINE_CACHE=1 \
        --cache-from "$TAG" .
```