k8s Nodes

## Cluster Autoscaler

* [User Guide](https://docs.aws.amazon.com/eks/latest/userguide/autoscaling.html#cluster-autoscaler)
* [GitHub](https://github.com/kubernetes/autoscaler)
* [FAQ](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md)
* [Cluster Autoscaler on AWS](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/cloudprovider/aws/README.md)

## Drain a node

```kubectl
kubectl drain --ignore-daemonsets --delete-emptydir-data ip-172-19-14-71.eu-central-1.compute.internal
```