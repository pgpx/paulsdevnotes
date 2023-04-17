# Crossplane

* <https://crossplane.io/>
* <https://aws.amazon.com/blogs/opensource/connecting-aws-managed-services-to-your-argo-cd-pipeline-with-open-source-crossplane/>
* <https://www.openpolicyagent.org/> - use OPA to decouple policy from the service's code so you can release, analyze, and review policies

* [provider-helm](https://github.com/crossplane-contrib/provider-helm/) is a Crossplane Provider that enables deployment and management of Helm Releases on Kubernetes clusters typically provisioned by Crossplane

## With ArgoCD

* [Issue](https://github.com/argoproj/argo-cd/issues/8683#issuecomment-1059477956) - to avoid ArgoCD seeing unnecessary out-of-sync. Have to set `resourceTrackingMethod` to annotation ([ref](https://argo-cd.readthedocs.io/en/latest/user-guide/resource_tracking/)) 

## Issues

There's an open issue in Crossplane's GitHub about how k8s clusters struggle to handle the large number of CRDs that Crossplane installs (e.g. AWS has 872) - https://github.com/crossplane/crossplane/issues/3852. Related issues have been open for over a year, which stopped me installing it into our cluster - have you hit that issue?

## Alternatives
Also, there are now alternatives: Cluster API (to create a k8s cluster in different cloud providers), and AWS and GCP projects to create their own resources, which seem to have fewer and higher-level CRDs (that don't just map API types 1:1) - https://cloud.google.com/config-connector/docs/overview and https://aws.amazon.com/blogs/containers/aws-controllers-for-kubernetes-ack/.  Not sure if Composite Resources would support those or if there is an equivalent.
