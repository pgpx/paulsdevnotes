# k8s Pods

* [v1.13 Pod v1 core](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.13/#podspec-v1-core)

## Commands

Wait for a pod to be ready ([SO](https://stackoverflow.com/a/60810347/125246)):

```bash
kubectl -n tools wait --for=condition=ready --timeout=300s pod/my-pod
```

List all container images used in a cluster ([ref](https://kubernetes.io/docs/tasks/access-application-cluster/list-all-running-container-images/#list-all-container-images-in-all-namespaces)):

```bash
kubectl get pods --all-namespaces -o jsonpath="{.items[*].spec.containers[*].image}" |\
tr -s '[[:space:]]' '\n' |\
sort |\
uniq -c
```

## Liveness & readiness probes

* [Configure Liveness and Readiness Probes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/)
* [How to Avoid Shooting Yourself in the Foot](https://blog.colinbreck.com/kubernetes-liveness-and-readiness-probes-how-to-avoid-shooting-yourself-in-the-foot/)
* [Utilizing Kubernetes Liveness and Readiness Probes to Automatically Recover From Failure](https://medium.com/spire-labs/utilizing-kubernetes-liveness-and-readiness-probes-to-automatically-recover-from-failure-2fe0314f2b2e)
* Should dependencies be tested? [Comment](https://medium.com/@andyhume/this-is-really-interesting-thanks-cc4122529382)

Problems

* e.g. missing host ([SO](https://stackoverflow.com/questions/49770036/kubernetes-probes-fail-on-tomcat))

## Configuration

* [Expose Pod Information to Containers Through Environment Variables](https://kubernetes.io/docs/tasks/inject-data-application/environment-variable-expose-pod-information/)
    * [Use pod fields as environment variables](https://kubernetes.io/docc/tasks/inject-data-application/environment-variable-expose-pod-information/#use-pod-fields-as-values-for-environment-variables):
        ```yaml
        env:
        - name: MY_NODE_NAME
          valueFrom:
            fieldRef:
              fieldPath: spec.nodeName
        - name: MY_POD_NAMESPACE
          valueFrom:
            fieldRef:
              fieldPath: metadata.namespace
        - name: MY_POD_IP
          valueFrom:
            fieldRef:
              fieldPath: status.podIP
        ```
    * [Use container fields as environment variables](https://kubernetes.io/docs/tasks/inject-data-application/environment-variable-expose-pod-information/#use-container-fields-as-values-for-environment-variables):
        ```yaml
      env:
        - name: MY_MEM_LIMIT
          valueFrom:
            resourceFieldRef:
              containerName: test-container
              resource: limits.memory
        ```
        
## Security Context

* [Configure a Security Context for a Pod or Container](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/)
* [Why non-root containers are important for security](https://engineering.bitnami.com/articles/why-non-root-containers-are-important-for-security.html) -  Because anyone who accesses your container running as root can start undesirable processes in it, such as injecting malicious code. And running a process in your container as root makes it possible to change the user id (UID) or group id (GID) when starting the container, which makes your application vulnerable.

```yaml
containers:
- name: java
  securityContext:
    privileged: false
    runAsNonRoot: true
    capabilities:
      add:
        - IPC_LOCK
        - SYS_RESOURCE
```

## Lifecycle

* [Pod Lifecycle](https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/) ref
    * [Attach Handlers to Container Lifecycle Events](https://kubernetes.io/docs/tasks/configure-pod-container/attach-handler-lifecycle-event/) - `postStart` and `preStop` handlers.
* [Gracefully Shutting Down Pods in a Kubernetes Cluster](https://blog.gruntwork.io/gracefully-shutting-down-pods-in-a-kubernetes-cluster-328aecec90d)
* [Delaying Shutdown to Wait for Pod Deletion Propagation](https://blog.gruntwork.io/delaying-shutdown-to-wait-for-pod-deletion-propagation-445f779a8304) - use `preStop` `sleep` commands to allow the container to still process requests while the pod is being removed from services, etc.

```yaml
lifecycle:
  preStop:
    exec:
        command: ["sleep", "10"]
```

* [Graceful shutdown and zero downtime deployments in Kubernetes](https://learnk8s.io/graceful-shutdown)

* Get name and image of pods ([SO](https://stackoverflow.com/questions/46229072/how-do-i-extract-multiple-values-from-kubectl-with-jsonpath))

```bash
kubectl get pods -ao jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.spec.containers[*].image}{"\n"}{end}'
```
