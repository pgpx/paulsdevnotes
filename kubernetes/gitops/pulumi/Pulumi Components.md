# Pulumi Components

* `dependsOn` will wait for all of a component's children ([release note](https://www.pulumi.com/blog/pulumi-release-notes-m60/#dependson-now-works-for-pulumi-component-packages-and-more) and [issue](https://github.com/pulumi/pulumi/issues/7542))

* Helm: Must use `pulumi.DependsOnInputs(chart.Ready)` (because `DependsOn` would only wait for the chart to be installed, and not actually have finished processing) ([ref](https://www.pulumi.com/registry/packages/kubernetes/api-docs/helm/v3/chart/#depend-on-a-chart-resource), [issue](https://github.com/pulumi/pulumi-kubernetes/issues/861))