# GitLab CI k8s

* [The Kubernetes Executor](https://docs.gitlab.com/runner/executors/kubernetes.html)
* [The [runners.cache] section](https://docs.gitlab.com/runner/configuration/advanced-configuration.html#the-runnerscache-section)

## [Overwriting Container Resources](https://docs.gitlab.com/runner/executors/kubernetes.html#overwriting-container-resources)

> Additionally, Kubernetes CPU and memory allocations for requests and limits for the build, helper and service containers can be overwritten on the .gitlab-ci.yml file with the following variables:

```yaml
variables:
  KUBERNETES_CPU_REQUEST: 3
  KUBERNETES_CPU_LIMIT: 5
  KUBERNETES_MEMORY_REQUEST: 2Gi
  KUBERNETES_MEMORY_LIMIT: 4Gi
  KUBERNETES_EPHEMERAL_STORAGE_REQUEST: 512Mi
  KUBERNETES_EPHEMERAL_STORAGE_LIMIT: 1Gi
  
  KUBERNETES_HELPER_CPU_REQUEST: 3
  KUBERNETES_HELPER_CPU_LIMIT: 5
  KUBERNETES_HELPER_MEMORY_REQUEST: 2Gi
  KUBERNETES_HELPER_MEMORY_LIMIT: 4Gi
  KUBERNETES_HELPER_EPHEMERAL_STORAGE_REQUEST: 512Mi
  KUBERNETES_HELPER_EPHEMERAL_STORAGE_LIMIT: 1Gi
  
  KUBERNETES_SERVICE_CPU_REQUEST: 3
  KUBERNETES_SERVICE_CPU_LIMIT: 5
  KUBERNETES_SERVICE_MEMORY_REQUEST: 2Gi
  KUBERNETES_SERVICE_MEMORY_LIMIT: 4Gi
  KUBERNETES_SERVICE_EPHEMERAL_STORAGE_REQUEST: 512Mi
  KUBERNETES_SERVICE_EPHEMERAL_STORAGE_LIMIT: 1Gi
```

> The values for these variables are restricted to the [max overwrite](https://docs.gitlab.com/runner/executors/kubernetes.html#the-available-configtoml-settings
> ) setting for that resource. If the max overwrite has not been set for a resource, the variable is ignored.

