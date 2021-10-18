# ArgoCD Issues

* Changes to Git submodules (referenced by a branch) are not detected by Argo CD ([issue](https://github.com/argoproj/argo-cd/issues/4590))
* Have to use `argocd app get "${app}" --hard-refresh` to force a rebuild of an app's manifest if only a custom plugin has changed but not the Git commit.
* Cannot add annotations/labels to namespaces created on demand (maybe [issue](https://github.com/argoproj/argo-cd/issues/6429)).
* Namespaces created with `--sync-option CreateNamespace=true` are not deleted when the app is deleted.
  * <https://github.com/argoproj/argo-cd/issues/4435>
  * <https://github.com/argoproj/argo-cd/issues/6067>
  * <https://github.com/argoproj/argo-cd/issues/3553>