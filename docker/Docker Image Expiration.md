# Docker Image Expiration

Auto-delete images after a defined period.

## Quay

Define a `quay.expires-after` label ([ref](https://access.redhat.com/documentation/en-us/red_hat_quay/3/html/use_red_hat_quay/working_with_tags#tag-expiration), [source](https://idbs-engineering.com/containers/2019/08/27/auto-expiry-quayio-tags.html)):

```dockerfile
LABEL quay.expires-after=2h
# or
LABEL quay.expires-after=2d
```

Or dynamically (e.g. to not expire release versions):

```dockerfile
ARG quay_expiration=never
LABEL maintainer="me@acme.com" quay.expires-after=${quay_expiration}
```
```bash
docker image build --build-arg quay_expiration=2h -t quay.io/acme/my-repo:0.0.1 .
```

