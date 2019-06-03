# kubectl

* [Reference](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands), [Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
* [Golang Templates Cheatsheet](https://curtisvermeeren.github.io/2017/09/14/Golang-Templates-Cheatsheet)

## [Get a shell to a running container](https://kubernetes.io/docs/tasks/debug-application-cluster/get-shell-running-container/)

```bash
kubectl exec -it shell-demo -- /bin/bash

# If more than one container in the pod
kubectl exec -it my-pod --container main-app -- /bin/bash
```



```bash
#if kubectl "-n=${NAMESPACE}" wait --timeout=0s --for=condition=Available deploy/ebdc-ee-app;
#if kubectl "-n=${NAMESPACE}" wait --timeout=0s --for=condition=Available "namespace/${NAMESPACE}";
#then echo "Deleting existing deployment...";
#    kubectl --namespace=ebdc-ci delete deploy/ebdc-ee-app;
#    kubectl delete namespace "${NAMESPACE}" #delete deploy/ebdc-ee-app;
#fi
```


## Port forwarding

```bash
# local port:remote port
kubectl port-forward -n my-namespace service/my-service 4444:4444
```

## Dump all k8s configuration

* <https://gist.github.com/negz/c3ee465b48306593f16c523a22015bec>