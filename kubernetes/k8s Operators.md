# k8s Operators

* <https://kubernetes.io/docs/concepts/extend-kubernetes/operator/>
* <https://operatorhub.io/> - OperatorHub.io is a new home for the Kubernetes community to share Operators 
* <https://cloud.google.com/blog/products/containers-kubernetes/best-practices-for-building-kubernetes-operators-and-stateful-apps>
* <https://operatorframework.io/>
* <https://kudo.dev/> - The Kubernetes Universal Declarative Operator

## Scope

[ref](https://sdk.operatorframework.io/docs/building-operators/golang/operator-scope/)

> A namespace-scoped operator watches and manages resources in a single Namespace, whereas a cluster-scoped operator watches and manages resources cluster-wide.

> An operator should be cluster-scoped if it watches resources that can be created in any Namespace. An operator should be namespace-scoped if it is intended to be flexibly deployed. This scope permits decoupled upgrades, namespace isolation for failures and monitoring, and differing API definitions.

## Kubebuilder

* <https://github.com/kubernetes-sigs/kubebuilder>

## Operator Lifecycle Manager

> OLM extends Kubernetes to provide a declarative way to install, manage, and upgrade Operators and their dependencies in a cluster.

* [GitHub](https://github.com/operator-framework/operator-lifecycle-manager)

## Secrets

* [Issue discussion](https://github.com/argoproj/argo-cd/issues/1364)

## Operator Framework

* <https://operatorframework.io/>
* [Operator SDK](https://sdk.operatorframework.io/)