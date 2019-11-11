# Kustomize vars

## Reading a value from a ConfigMap

Can define the ConfigMap and var in `kustomization.yaml`:

```yaml
# Define the ConfigMap
configMapGenerator:
- name: my-map
  literals:
    - my-key=my-value

# Reference the key/value
vars:
- name: my-var
  objref:
    apiVersion: v1
    kind: ConfigMap
    name: my-map
  fieldref:
    fieldpath: data.my-key
```

## Using a variable to token-replace arbitrary fields

* [Supporting Custom Resources (defined by a CRD)](https://github.com/kubernetes-sigs/kustomize/blob/master/examples/transformerconfigs/crd/README.md)
* <https://github.com/kubernetes-sigs/kustomize/issues/860>

Define a configuration file specifying where the variable can be used:

`my-configuration.yaml`:

```yaml
varReference:
- path: spec/containers/command
  kind: MyKind
- path: spec/beeRef/action
  kind: MyKind
- path: data
  kind: ConfigMap
```


## Reference a service's port

Save the port as a var in `kustomaization.yaml`:

```yaml
vars:
  - name: CARBON_PORT
    objref:
      apiVersion: v1
      kind: Service
      name: graphite
    fieldref:
      fieldpath: spec.ports[0].port
```

Use the var to define a variable in a container spec:

```yaml
env:
- name: CARBON_PORT
  value: $(CARBON_PORT)
```  
