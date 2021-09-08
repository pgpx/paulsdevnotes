# ArgoCD Application Sets

* [GitHub](https://github.com/argoproj-labs/applicationset)
* [Blog](https://blog.argoproj.io/introducing-the-applicationset-controller-for-argo-cd-982e28b62dc5)

## Why?

The 'App of Apps' pattern works, but has some limitations ([ref](https://argocd-applicationset.readthedocs.io/en/stable/Use-Cases/#use-case-self-service-of-argo-cd-applications-on-multitenant-clusters)):

* Needs permissions to deploy to the ArgoCD repo.
* Cannot enforce security - can (accidentally) use a different `project` id and the application will be deployed to that project/cluster/namespace.

## Git Generator

* [ref](https://argocd-applicationset.readthedocs.io/en/stable/Generators-Git/)

Generator that looks for JSON or YAML files that are used to supply template values to the templated Appliction spec.

* `Directories` mode - list of directories to look for in the target repo - can include and exclude (will exclude if matches at least one exclude pattern, regardless of includes).
* `Files` mode - Uses the contents of matching JSON/YAML files (within the target repo).  Can use glob patterns (?), including `**` and `*` 



