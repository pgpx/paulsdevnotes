# Docker Image Signing

* [Content trust in Docker](https://docs.docker.com/engine/security/trust/)
* [cosign](https://github.com/sigstore/cosign) - Container Signing, Verification and Storage in an OCI registry
  * [Notary V2 and Cosign](https://dlorenc.medium.com/notary-v2-and-cosign-b816658f044d)
* [skopeo](https://github.com/containers/skopeo) can sign images using [copy --sign-by=key-id](https://github.com/containers/skopeo)

* <https://www.openshift.com/blog/signing-and-verifying-container-images>>

k8s integrations

* [k8s issue](https://github.com/kubernetes/kubernetes/issues/30603)
* <https://github.com/sse-secure-systems/connaisseur>, [blog](https://medium.com/sse-blog/container-image-signatures-in-kubernetes-19264ac5d8ce)
* <https://github.com/IBM/portieris>