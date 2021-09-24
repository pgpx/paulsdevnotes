# k8s Requests and Limits

* Google Cloud: [Kubernetes best practices: Resource requests and limits](https://cloud.google.com/blog/products/containers-kubernetes/kubernetes-best-practices-resource-requests-and-limits)

## General

* Pods are scheduled by considering their requested values compared to the total requests on a node.
* If the sum of all limits exceeds node capacity, the node is [overcommitted](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/node/resource-qos.md#qos-classes).

## CPU

* requests - millicores, e.g. 2 full cores is `2000m` ([ref](https://cloud.google.com/blog/products/containers-kubernetes/kubernetes-best-practices-resource-requests-and-limits))
* limits - will never use more than this amount of CPU.
* overcommitted - will throttle CPU so that pods get at least their requests (compressed).

## Memory

* requests - guaranteed memory (roughly, unless k8s resources use too much)
* limits - will be terminated if exceeded
* overcommitted - have to terminate pods - more likely to kill those over their requests (or without requests).