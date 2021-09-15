# ArgoCD Plugins

* [Example plugins](https://github.com/argoproj/argocd-example-apps/tree/master/plugins)
* <https://github.com/travisghansen/argo-cd-helmfile> - Example plugin

## Environment variables

Run-specific:

* `ARGOCD_APP_NAME` - Application's name`test-app2`
* `ARGOCD_APP_NAMESPACE` - Target namespace
* `ARGOCD_APP_REVISION` - Git revision that was checked out (digest)
* `ARGOCD_APP_SOURCE_PATH` - Relative path within the checked-out repo - `src/environment/ci`
* `ARGOCD_APP_SOURCE_REPO_URL` - Git repo URL
* `ARGOCD_APP_SOURCE_TARGET_REVISION` - Target revision name, e.g. branch
* `KUBE_API_VERSIONS` - k8s resource versions, e.g. `v1,apiregistration.k8s.io/v1,apiregistration.k8s.io/v1beta1,...`
* `PWD` - Temp directory where the repo is checked out, e.g. ` /tmp/https:__my_repo_url_sub_path/src/environment/ci`

From the repo server itself:

* `ARGOCD_APPLICATION_CONTROLLER_*`, `ARGOCD_REDIS_*`, `ARGOCD_REPO_SERVER_*`, `ARGOCD_SERVER_*` - internal ArgoCD details
* `AWS_ACCESS_KEY_ID`, `AWS_REGION`, `AWS_SECRET_ACCESS_KEY` - k8s credentials
* `DEBIAN_FRONTEND` - `noninteractive`
* `GIT_ASKPASS` - `git-ask-pass.sh`
* `GIT_PASSWORD`, `GIT_USERNAME` - Git credentials
* `HOME` - `/home/argocd/`
* `HOSTNAME` - `argocd-repo-server-577f8c84bc-54sv4`
* `KUBERNETES_*` - k8s connection details
* `PATH` - `/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'`
* `SHLVL` - `"1"`
* `USER` - `argocd`
* `XDG_CONFIG_HOME` - `'/.config'`
