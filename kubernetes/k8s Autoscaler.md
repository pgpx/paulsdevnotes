# k8s Autoscaler

## Articles

* [Kubernetes Cluster Autoscaler: More than scaling out](https://itnext.io/kubernetes-cluster-autoscaler-more-than-scaling-out-7b2d97f10b27)

## [What types of pods can prevent CA from removing a node?](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#what-types-of-pods-can-prevent-ca-from-removing-a-node)

* Pods with restrictive PodDisruptionBudget.
* Kube-system pods that:
  * are not run on the node by default,
  * don't have a pod disruption budget set or their PDB is too restrictive (since CA 0.6).
* Pods that are not backed by a controller object (so not created by deployment, replica set, job, stateful set etc). *
* Pods with local storage.
* Pods that cannot be moved elsewhere due to various constraints (lack of resources, non-matching node selectors or affinity, matching anti-affinity, etc)
* Pods that have the following annotation set: `"cluster-autoscaler.kubernetes.io/safe-to-evict": "false"`

Unless the pod has the following annotation (supported in CA 1.0.3 or later): `"cluster-autoscaler.kubernetes.io/safe-to-evict": "true"`

Or you have overridden this behaviour with one of the relevant flags.