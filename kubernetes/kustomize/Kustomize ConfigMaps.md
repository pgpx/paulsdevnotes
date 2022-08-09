# Kustomize ConfigMaps

## [configMapGenerator](https://kubectl.docs.kubernetes.io/references/kustomize/kustomization/configmapgenerator/)

```yaml
configMapGenerator:
  - name: my-java-server-props
    behavior: merge
    files:
      - application.properties
      - more.properties
  - name: my-java-server-env-file-vars
    envs:
      # Files contain key=value lines
      - my-server-env.properties
      - more-server-props.env
  - name: my-java-server-env-vars
    literals:
      - JAVA_HOME=/opt/java/jdk
      - JAVA_TOOL_OPTIONS=-agentlib:hprof
    options:
      disableNameSuffixHash: true
      labels:
        pet: dog
```

## [secretGenerator](https://kubectl.docs.kubernetes.io/references/kustomize/kustomization/secretgenerator/)
