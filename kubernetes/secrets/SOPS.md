# SOPS

* <https://github.com/mozilla/sops>

Encrypt secrets in manifests using regex patterns, and decrypt them when deploying them to the server. 

* FluxCD [Manage Kubernetes secrets with Mozilla SOPS](https://fluxcd.io/docs/guides/mozilla-sops/)

## .sops.yaml

[.sops.yaml](https://github.com/mozilla/sops#using-sops-yaml-conf-to-select-kms-pgp-for-new-files) is a configuration file (in the root of each project) that controls [which parts of SOPS-encrypted files should be encrypted](https://github.com/mozilla/sops#using-sops-yaml-conf-to-select-kms-pgp-for-new-files), and the [KMS/PGP values used to encrypt them](https://github.com/mozilla/sops#211using-sopsyaml-conf-to-select-kmspgp-for-new-files).

```yaml
creation_rules:
  # Only encrypt secret values: https://github.com/mozilla/sops#49encrypting-only-parts-of-a-file
  - encrypted_regex: '^(data|stringData)$'
    kms: 'arn:aws:kms:eu-central-1:12345:key/67890'
```

## KSOPS - kustomize-sops

* <https://github.com/viaduct-ai/kustomize-sops> - Kustomize plugin for SOPS

Define a generator in `kustomization.yaml`:

```yaml
generators:
  - ksops.yaml
```

And the `ksops` generator then references the secrets:

```yaml
apiVersion: viaduct.ai/v1
kind: ksops
metadata:
  name: ksops
files:
  - secrets.enc.yaml
```

Merge values by adding annotations:

```yaml
apiVersion: v1
kind: Secret
metadata:
    name: rest-api
    annotations:
        # merge the base secret data/stringData values with these encrypted data/stringData values
        kustomize.config.k8s.io/needs-hash: "true"
        kustomize.config.k8s.io/behavior: merge
type: Opaque
stringData:
    pasword: 6789
    new-value: 12345
```