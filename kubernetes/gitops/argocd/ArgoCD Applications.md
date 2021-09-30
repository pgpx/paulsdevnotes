# ArgoCD Applications

## `argocd app create`

* [CLI Ref](https://argoproj.github.io/argo-cd/user-guide/commands/argocd_app_create/)

* Create the target namespace if it doesn't exist (but it won't get deleted when the app is deleted): `--sync-option CreateNamespace=true`

## [Deletion](https://argoproj.github.io/argo-cd/user-guide/app_deletion/#app-deletion)

Via CLI ([ref](https://argoproj.github.io/argo-cd/user-guide/app_deletion/#deletion-using-argocd)), will delete all associated resources:

```bash
argocd app delete <app-name> --yes
```

Via `kubectl` ([ref](https://argoproj.github.io/argo-cd/user-guide/app_deletion/#deletion-using-kubectl)), will only delete if the app is patched first (though don't do this by default for all apps, because then they can/will be deleted if ArgoCD itself is deleted) (related [issue](https://github.com/argoproj/argo-cd/issues/5305)):

```bash
kubectl patch app APPNAME  -p '{"metadata": {"finalizers": ["resources-finalizer.argocd.argoproj.io"]}}' --type merge
kubectl delete app APPNAME
```

## Kustomize

* <https://argoproj.github.io/argo-cd/user-guide/kustomize/>

Can set name prefix/suffix, labels, annotations, override images