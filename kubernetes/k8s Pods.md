# k8s Pods

* [v1.13 Pod v1 core](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.13/#podspec-v1-core)

## Commands

Wait for a pod to be ready ([SO](https://stackoverflow.com/a/60810347/125246)):

```bash
kubectl -n tools wait --for=condition=ready --timeout=300s pod/my-pod
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
    * [Use pod fields as environment variables](https://kubernetes.io/docs/tasks/inject-data-application/environment-variable-expose-pod-information/#use-pod-fields-as-values-for-environment-variables):
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