# k8s Secrets

* <https://kubernetes.io/docs/concepts/configuration/secret/>

## Bitnami Sealed Secrets

* <https://github.com/bitnami-labs/sealed-secrets>

Encrypt your Secret into a SealedSecret, which is safe to store - even to a public (Git) repository. The SealedSecret can be decrypted only by the controller running in the target cluster and nobody else (not even the original author) is able to obtain the original Secret from the SealedSecret.