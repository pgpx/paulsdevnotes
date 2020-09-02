# k8s Scheduling

The k8s scheduler chooses which node will be used to deploy a pod.

* <https://itnext.io/keep-you-kubernetes-cluster-balanced-the-secret-to-high-availability-17edf60d9cb7>
* <https://www.replex.io/blog/kubernetes-in-production-best-practices-for-cluster-autoscaler-hpa-and-vpa>
* <https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes/>
* <https://kubernetes.io/blog/2017/03/advanced-scheduling-in-kubernetes/>
* <https://thenewstack.io/implementing-advanced-scheduling-techniques-with-kubernetes/>

Can currently select the node when first, but will currently not move it to another node if circumstances change.

* Can use [descheduler](https://github.com/kubernetes-sigs/descheduler) as a workaroud - evicts the pod, which will hopefully cause it to be redeployed to a different node (if its deployment exists). 