# Helm secrets

* [jkroepke/helm-secrets](https://github.com/jkroepke/helm-secrets) - fork of <https://github.com/zendesk/helm-secrets>

Use `sops://secrets.yaml` when including SOPS-encrypted values files.  For example, in ArgoCD:

```yaml
spec:
  source:
    helm:
      valueFiles:
        - values.yaml
        - sops://secrets.prod.yaml
```