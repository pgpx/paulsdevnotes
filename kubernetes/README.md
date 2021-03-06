# Kubernetes

* [Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
* [Documentation](https://kubernetes.io/docs/home/?path=users&persona=app-developer&level=foundational), [Concepts](https://kubernetes.io/docs/concepts/)
* [Kubeapps Hub](https://hub.kubeapps.com/) - k8s-ready apps
* [Kubernetes Examples](https://github.com/kubernetes/examples) - [Selenium](https://github.com/kubernetes/examples/tree/master/staging/selenium)
* Kubernetes API - [v1.13](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.13/), [API Conventions](https://github.com/kubernetes/community/blob/master/contributors/devel/api-conventions.md#metadata)
* <https://github.com/kubernetes/community> - Kubernetes community content
* <https://www.katacoda.com/courses/kubernetes> - Learn Kubernetes using Interactive Browser-Based Scenarios

## Concepts

* [Configuration Best Practices](https://kubernetes.io/docs/concepts/configuration/overview/)
* [Field Selectors](https://kubernetes.io/docs/concepts/overview/working-with-objects/field-selectors/)
* [Labels and Selectors](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/)
* [Managing Resources](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/)
* [Namespaces](https://kubernetes.io/docs/tasks/administer-cluster/namespaces-walkthrough/)
* [Network Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
* [Nodes](https://kubernetes.io/docs/concepts/architecture/nodes/)
* [Pod Preset](https://kubernetes.io/docs/concepts/workloads/pods/podpreset/) - injecting additional runtime requirements into a Pod at creation time.  Use label selectors to specify the Pods (so authors of the Pods don't need to know all of this).
* [Services](https://kubernetes.io/docs/concepts/services-networking/service/)
* [DNS for Services and Pods](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)

## Best practices

* <https://cloud.google.com/blog/products/gcp/kubernetes-best-practices-organizing-with-namespaces> - [kubens](https://github.com/ahmetb/kubectx)
* [11 Ways (Not) to Get Hacked](https://kubernetes.io/blog/2018/07/18/11-ways-not-to-get-hacked/)
  
## Articles

* [Shifting from Infrastructure as Code to Infrastructure as Data](https://medium.com/dzerolabs/shifting-from-infrastructure-as-code-to-infrastructure-as-data-bdb1ae1840e3)

## Related tools

* [Kind](https://kind.sigs.k8s.io/) - a tool for running local Kubernetes clusters using Docker container “nodes”.
* [Kustomize](https://github.com/kubernetes-sigs/kustomize) - templating for k8s YAML files.
    * <https://medium.com/@at_ishikawa/getting-started-with-kustomize-53f600f9ebaa>
    * <https://kubernetes.io/blog/2018/05/29/introducing-kustomize-template-free-configuration-customization-for-kubernetes/>
* [operator-sdk](https://github.com/operator-framework/operator-sdk) - SDK for building Kubernetes application
* Istio
    * <https://programmaticponderings.com/2018/04/13/managing-applications-across-multiple-kubernetes-environments-with-istio-part-1/>
* [Kapp](https://get-kapp.io/)
* [kOps](https://github.com/kubernetes/kops) - Kubernetes Operations - The easiest way to get a production grade Kubernetes cluster up and running.
* [Velero](https://velero.io/) - is an open source tool to safely backup and restore, perform disaster recovery, and migrate Kubernetes cluster resources and persistent volumes.
    
## Blogs

* <https://medium.com/@SandeepDinesh>