# k8s Configuration

* [Assigning Pods to Nodes](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/)

    ```yaml
    nodeSelector:
        kubernetes.io/hostname: ip-10-250-197-253.eu-west-2.compute.internal
    ```