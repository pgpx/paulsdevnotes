# Kustomize patches

Inline patches: [examples](https://github.com/kubernetes-sigs/kustomize/blob/master/examples/inlinePatch.md) and [ref](https://github.com/kubernetes-sigs/kustomize/blob/master/docs/plugins/builtins.md#field-name-patches)

* [Bug report for schema being invalid](https://github.com/kubernetes-sigs/kustomize/issues/205)

* [JSON Patch - rfc6902](https://tools.ietf.org/html/rfc6902)

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
