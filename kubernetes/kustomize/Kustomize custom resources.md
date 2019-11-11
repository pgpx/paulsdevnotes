# Kustomize custom resources

* Ref: [Supporting Custom Resources (defined by a CRD)](https://github.com/kubernetes-sigs/kustomize/blob/master/examples/transformerconfigs/crd/README.md)

Define a Kustomize configuration file that contains:

Where common labels will be added (here at `.spec.selectors` for document type `MyKind`):

```yaml
commonLabels:
- path: spec/selectors
  create: true
  kind: MyKind
```

Define fields that reference other documents:

```yaml
- kind: Bee     # Target type of reference
  fieldSpecs:
  - path: spec/beeRef/name  # Path within MyKind of the reference to a Bee
    kind: MyKind
```

Define fields that can accept var interpolation:

```yaml
varReference:
- path: spec/containers/command
  kind: MyKind
- path: spec/beeRef/action
  kind: MyKind
```

To allow ConfigMaps to interpolate vars:

```yaml
varReference:
- path: data
  kind: ConfigMap
```

Then reference this configuration file in `kustomize.yaml`:

```yaml
configurations:
- my-configuration.yaml
```