# Helm CRDs

Helm can install CRDs, but will not upgrade them ([ref](https://helm.sh/docs/chart_best_practices/custom_resource_definitions/#some-caveats-and-explanations))

> There is no support at this time for upgrading or deleting CRDs using Helm. This was an explicit decision after much community discussion due to the danger for unintentional data loss.

The best suggestion is to update the CRDs separately, e.g. in a separate ArgoCD app ([ref](https://github.com/argoproj/argo-cd/discussions/5160#discussioncomment-292186))