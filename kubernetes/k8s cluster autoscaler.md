# Cluster Autoscaler

* <https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler>
* [FAQ](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md)

## Troubleshooting

The `cluster-autoscaler-status` configmap is updated every minute ([ref](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#how-can-i-check-what-is-going-on-in-ca-)).  Can check its events as well:

```bash
$ kubectl get events --namespace kube-system --field-selector involvedObject.name=cluster-autoscaler-status
LAST SEEN   TYPE     REASON           OBJECT                                MESSAGE
16m         Normal   ScaleDownEmpty   configmap/cluster-autoscaler-status   Scale-down: removing empty node ip-172-22-12-145.eu-central-1.compute.internal
```