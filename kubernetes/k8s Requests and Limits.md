# k8s Requests and Limits

Articles:

* Google Cloud: [Kubernetes best practices: Resource requests and limits](https://cloud.google.com/blog/products/containers-kubernetes/kubernetes-best-practices-resource-requests-and-limits)
* [Setting the right requests and limits in Kubernetes](https://learnk8s.io/setting-cpu-memory-limits-requests)
* [Understanding resource limits in kubernetes: memory](https://medium.com/@betz.mark/understanding-resource-limits-in-kubernetes-memory-6b41e9a955f9)
    >  Processes that are not in memory cgroups are handled by the global oomkiller, and when the kernel is unable to allocate pages it will essentially kill the process using the most physical ram, scaled by a factor called the oom adjust score that is used to protect important processes. Processes that are in memory cgroups are affected by the cgroup oomkiller, which will always kill them if they set a limit and then exceed it. In these cases you’ll see a log message from the oomkiller that begins `Memory cgroup out of memory: Kill process ....`
* [A Practical Guide to Setting Kubernetes Requests and Limits](https://blog.kubecost.com/blog/requests-and-limits/) - also see [Kubecost](https://github.com/kubecost/cost-model) - visibility into current and historical Kubernetes spend and resource allocation.
    > When setting requests, start by determining the acceptable probability of a container’s usage exceeding its request in a specific time window, e.g. 24 hours. To predict this in future periods, we can analyze historical resource usage. As an example, allowing usage to be above a request threshold with 0.01 probability (i.e. three nines) means that it will, on average, face increased risk of throttling or being killed 1.44 minutes a day.
* [How to rightsize the Kubernetes resource limits](https://sysdig.com/blog/kubernetes-resource-limits/) - using Prometheus metrics.

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