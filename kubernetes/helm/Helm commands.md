# Helm commands

## Install a new chart

```bash
helm 
```

## Render chart templates locally and display the output ([SO](https://unix.stackexchange.com/a/22728/32390))

* [Ref](https://docs.helm.sh/helm/#helm-template)

```bash
helm template mychart -f secrets.yaml
```

## Providers

* AWS: [GitHub](https://github.com/crossplane/provider-aws), [API](https://doc.crds.dev/github.com/crossplane/provider-aws)