# Kustomize patches

Inline patches: [examples](https://github.com/kubernetes-sigs/kustomize/blob/master/examples/inlinePatch.md) and [ref](https://github.com/kubernetes-sigs/kustomize/blob/master/docs/plugins/builtins.md#field-name-patches)

* [Bug report for schema being invalid](https://github.com/kubernetes-sigs/kustomize/issues/205)

* [JSON Patch - rfc6902](https://tools.ietf.org/html/rfc6902)

  * Escape `/` with `~1` and `~` with `~0` ([ref](https://datatracker.ietf.org/doc/html/rfc6901#section-3))

```yaml
patches:
  - patch: |-
      - op: replace
        path: /spec/rules/0/host
        value: my-new-url
    target:
      kind: Ingress
      name: grafana
```

```yaml
patchesJson6902:
  - target:
      kind: Ingress
      name: grafana
      group: extensions
      version: v1beta1
    patch: |-
      - op: replace
        path: /spec/rules/0/host
        value: my-new-url

```

```yaml
# Use ~1 to escape / in JSON Patch! http://jsonpatch.com/#json-pointer
patches:
  - patch: |-
      - op: replace
        path: /metadata/annotations/alb.ingress.kubernetes.io~1certificate-arn
        value: other-stuff
    target:
      kind: Ingress
      name: app
```


Add to an array: <https://github.com/kubernetes-sigs/kustomize/issues/642>

```yaml
patches:
  - patch: |-
      - op: add
        path: /spec/template/spec/volumes/-
        value:
          name: dev-runner
          persistentVolumeClaim:
            claimName: dev-runner-pvc
    target:
      kind: Deployment
      name: runner
```