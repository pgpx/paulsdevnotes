# k8s Scheduling

The k8s scheduler chooses which node will be used to deploy a pod.

* [Scheduling overview](https://kubernetes.io/docs/concepts/scheduling-eviction/kube-scheduler/)
    * [Assigning pods to nodes](Assigning Pods to Nodes) - node selector/isolation/affinity
* [Pod Topology Spread Constraints](https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/) - Needs v1.19 - ontrol how Pods are spread across your cluster among failure-domains such as regions, zones, nodes, and other user-defined topology domains. This can help to achieve high availability as well as efficient resource utilization.
* [Advanced scheduling](https://kubernetes.io/blog/2017/03/advanced-scheduling-in-kubernetes/)
  
Tools:

* [descheduler](https://github.com/kubernetes-sigs/descheduler) - forces pods to be deleted and rescheduled.

Links:

* <https://itnext.io/keep-you-kubernetes-cluster-balanced-the-secret-to-high-availability-17edf60d9cb7>
* <https://www.replex.io/blog/kubernetes-in-production-best-practices-for-cluster-autoscaler-hpa-and-vpa>
* <https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes/>
* <https://kubernetes.io/blog/2017/03/advanced-scheduling-in-kubernetes/>
* <https://thenewstack.io/implementing-advanced-scheduling-techniques-with-kubernetes/>

Can currently select the node when first, but will currently not move it to another node if circumstances change.

* Can use [descheduler](https://github.com/kubernetes-sigs/descheduler) as a workaroud - evicts the pod, which will hopefully cause it to be redeployed to a different node (if its deployment exists).

## Assigning pods to nodes

* k8s suggests don't use them in large clusters >200 nodes [ref](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity)

* Without specifying anything, k8s should spread pods in a ReplicaSet/Deployment to different notes, according to [priorities](https://kubernetes.io/docs/reference/scheduling/policies/#priorities) (`SelectorSpreadPriority` and maybe `EvenPodsSpreadPriority`)
* However this won't by itself force pods (in a `ReplicaSet`) to be deployed to separate nodes, e.g. in an (underutilised) autoscaling group with fewer nodes than desired pod replicas (I think this is somewhat equivalent to preferredDuringSchedulingIgnoredDuringExecution , whereas requiredDuringSchedulingIgnoredDuringExecution would not schedule the pod at all if the conditions can't be fulfilled.)
* However, the alternative with `required...` anti-affinity rules is that the pod just won't get run until a (replacement) node is available, and maybe that isn't wanted either.
* So also consider something like [descheduler's removeduplicates](https://github.com/kubernetes-sigs/descheduler#removeduplicates) - which will periodically and automatically kill selected pods to force them to be rescheduled in a more balanced manner.