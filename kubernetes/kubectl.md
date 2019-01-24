# kubectl

* [Reference](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands), [Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
* [Golang Templates Cheatsheet](https://curtisvermeeren.github.io/2017/09/14/Golang-Templates-Cheatsheet)

## [Get a shell to a running container](https://kubernetes.io/docs/tasks/debug-application-cluster/get-shell-running-container/)

```bash
kubectl exec -it shell-demo -- /bin/bash

# If more than one container in the pod
kubectl exec -it my-pod --container main-app -- /bin/bash
```