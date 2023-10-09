# k8s Autoscaler

* [Helm charts](https://github.com/kubernetes/autoscaler/tree/master/charts)

## Alternatives

* [Karpenter](https://karpenter.sh)
* [KEDA](https://keda.sh/)
  * [KEDA: Kubernetes Event-Driven Autoscaling](https://www.youtube.com/watch?v=3lcaawKAv6s)
* [Creating Kubernetes Auto Scaling Groups for Multiple Availability Zones](https://aws.amazon.com/blogs/containers/amazon-eks-cluster-multi-zone-auto-scaling-groups/) - create 1 ASG per AZ if you use EBS volumes (which are fixed to 1 AZ).

## Issues

* [add annotation to ignore local storage volume during scale down](https://github.com/kubernetes/autoscaler/pull/5594) - `"cluster-autoscaler.kubernetes.io/safe-to-evict-local-volumes": "volume-1,volume-2"`
* 
## Articles

* [Kubernetes Cluster Autoscaler: More than scaling out](https://itnext.io/kubernetes-cluster-autoscaler-more-than-scaling-out-7b2d97f10b27)
* [Creating Kubernetes Auto Scaling Groups for Multiple Availability Zones](https://aws.amazon.com/blogs/containers/amazon-eks-cluster-multi-zone-auto-scaling-groups/)

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

## AWS

* [ref](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/cloudprovider/aws/README.md)
* [Common Notes and Gotchas](https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler/cloudprovider/aws#common-notes-and-gotchas)

### ASG tags when scaling AWS nodegroups from 0

* [ref](https://aws.github.io/aws-eks-best-practices/cluster-autoscaling/#scaling-from-0)

Must set the following tags on the autoscaling group (created by a managed node group) to enable the cluster-autoscaler to scale from 0:

```
Key: k8s.io/cluster-autoscaler/node-template/resources/$RESOURCE_NAME
Value: 5
Key: k8s.io/cluster-autoscaler/node-template/label/$LABEL_KEY
Value: $LABEL_VALUE
Key: k8s.io/cluster-autoscaler/node-template/taint/$TAINT_KEY
Value: <taint-value>:NoSchedule (or NO_SCHEDULE)
```

e.g.

```
k8s.io/cluster-autoscaler/node-template/label/foo: bar
k8s.io/cluster-autoscaler/node-template/taint/dedicated: true:NoSchedule
k8s.io/cluster-autoscaler/node-template/resources/ephemeral-storage: 100G

# To speed up GPU 
```

For GPUs:

> device plugin on nodes that provides GPU resources can take some time to advertise the GPU resource to the cluster. This may cause Cluster Autoscaler to unnecessarily scale out multiple times

```
k8s.amazonaws.com/accelerator=<gpu-type>
```