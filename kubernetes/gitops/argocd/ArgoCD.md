# ArgoCD

* https://argoproj.github.io/argo-cd/>, [GitHub](https://github.com/argoproj/argo-cd/)
* Argo Rollouts ([home](https://argoproj.github.io/argo-rollouts/), [GitHub](https://github.com/argoproj/argo-rollouts))

## Initial login

Get the initial admin password: ([ref](https://argoproj.github.io/argo-cd/getting_started/#4-login-using-the-cli)):
```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

Port-forward argocd-server to 8080
And: `argocd login localhost:8080 --username admin # and use the password`

## Multi-tenancy

* [Hassle-free multi-tenant K8S clusters management using Argo CD](https://blog.argoproj.io/hassle-free-multi-tenant-k8s-clusters-management-using-argo-cd-7dd35619046a)
* [Project-scoped Repositories and Clusters - enhancement idea](https://github.com/argoproj/argo-cd/blob/master/docs/proposals/project-repos-and-clusters.md)

## Argo CD Operator

* [Docs](https://argocd-operator.readthedocs.io/en/latest/), [GitHub](https://github.com/argoproj-labs/argocd-operator/)

## Argo CD Image Updater

> A tool to automatically update the container images of Kubernetes workloads which are managed by Argo CD

* [GitHub](https://github.com/argoproj-labs/argocd-image-updater)
