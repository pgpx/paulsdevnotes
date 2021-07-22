# Kustomize with Helm

* <https://github.com/kubernetes-sigs/kustomize/blob/master/examples/chart.md
    * Similarly <https://blog.container-solutions.com/using-helm-and-kustomize-to-build-more-declarative-kubernetes-workloads>

Recommends:

> a user can inflate the chart themselves at the command line, e.g.

    ```bash
    helm template {releaseName} \
    --values {valuesFile} \
    --version {version} \
    --repo {repo} \
    {chartName} > {chartName}.yaml
    ```

> then commit the resulting {chartName}.yaml file to a git repo as a configuration base, mentioning that file as a resource in a kustomization.yaml file, e.g.

    ```yaml
    resources:
    - minecraft_v3.1.3_Chart.yaml
    ```
