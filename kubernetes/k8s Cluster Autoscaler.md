# Cluster Autoscaler

* <https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler>
* [FAQ](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md)

## AWS commands

* List autoscaling groups: `aws autoscaling describe-auto-scaling-group`

## Remove a node

First [drain](https://kubernetes.io/docs/tasks/administer-cluster/safely-drain-node/) the
node: `kubectl drain <node-name>`

Then either wait for the autoscaler to scale down the EKS Node Group (will take 10 mins, depending on config), or do that manually from the AWS ASG console.

Just deleting the node using k9s will *not* delete the underlying instance, so cluster autoscaler will log messages such
as `unregistered nodes present` and will not scale up new nodes to replace it (until the node has been deleted from AWS), and just deleting the node from the AWS console will often cause the ASG to recreate it (if the autoscaler has not yet updated its desired number of nodes).

## Taints and tolerations

For AWS, need to add tags to the autoscaling group for the cluster-autoscaler to be able to use taints and tolerations when scaling the group from 0 nodes (would normally use taints and tolerations from existing nodes in the group, but cannot do that if there are 0):

```
k8s.io/cluster-autoscaler/node-template/label/<key>=<value
k8s.io/cluster-autoscaler/node-template/taint/<key>=<value>:<effect>
```

If using managed node groups, then you must still apply these to the associated ASG.  For example in Pulumi:

```go
asgName := nodegroup.Resources.ApplyT(func(resources []eks.NodeGroupResource) (string, error) {
    if len(resources) != 1 || len(resources[0].AutoscalingGroups) != 1 {
		// Can't easily handle more than 1 generated ASG in Pulumi
        return "", fmt.Errorf("NodeGroup has invalid ASG configuration")
    }
    return *resources[0].AutoscalingGroups[0].Name, nil
}).(pulumi.StringOutput)

_, err = autoscaling.NewTag(ctx, "asg-tag", &autoscaling.TagArgs{
    AutoscalingGroupName: asgName,
    Tag: autoscaling.TagTagArgs{
        Key:               pulumi.String("k8s.io/cluster-autoscaler/node-template/label/my-label"),
        PropagateAtLaunch: pulumi.Bool(true),
        Value:             pulumi.String("my-value"),
    },
}, pulumi.DependsOn([]pulumi.Resource{res}))
if err != nil {
    return
}
```

Note that changes to the taints/labels are only read the first time that the cluster-autoscaler needs them and then are cached, so you need to restart it if values are changed!

## Troubleshooting

The `cluster-autoscaler-status` configmap is updated every
minute ([ref](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#how-can-i-check-what-is-going-on-in-ca-))
. Can check its events as well:

```bash
$ kubectl get events --namespace kube-system --field-selector involvedObject.name=cluster-autoscaler-status
LAST SEEN   TYPE     REASON           OBJECT                                MESSAGE
16m         Normal   ScaleDownEmpty   configmap/cluster-autoscaler-status   Scale-down: removing empty node ip-172-22-12-145.eu-central-1.compute.internal
```

