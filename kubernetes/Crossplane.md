# Crossplane

* <https://crossplane.io/>
* <https://aws.amazon.com/blogs/opensource/connecting-aws-managed-services-to-your-argo-cd-pipeline-with-open-source-crossplane/>
* <https://www.openpolicyagent.org/> - use OPA to decouple policy from the service's code so you can release, analyze, and review policies

* [provider-helm](https://github.com/crossplane-contrib/provider-helm/) is a Crossplane Provider that enables deployment and management of Helm Releases on Kubernetes clusters typically provisioned by Crossplane

## With ArgoCD

* [Issue](https://github.com/argoproj/argo-cd/issues/8683#issuecomment-1059477956) - to avoid ArgoCD seeing unnecessary out-of-sync. Have to set `resourceTrackingMethod` to annotation ([ref](https://argo-cd.readthedocs.io/en/latest/user-guide/resource_tracking/)) 