# kubectl

* [Reference](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands), [Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
* [Golang Templates Cheatsheet](https://curtisvermeeren.github.io/2017/09/14/Golang-Templates-Cheatsheet)
* [JSONPath support](https://kubernetes.io/docs/reference/kubectl/jsonpath/)

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

## Custom columns in output

Use `[*]` to output all values from an array ([SO](https://stackoverflow.com/a/43521302/125246)):

```bash
kubectl get gateway -o custom-columns='NAMESPACE:metadata.namespace,NAME:metadata.name,CERT:spec.servers[*].tls.credentialName' -A
kubectl get certificates -o custom-columns='NAMESPACE:metadata.namespace,NAME:metadata.name,DNS-NAMES:spec.dnsNames,ISSUER:spec.issuerRef.name' -A
```

* Use `[?(@.Key=="Value"]` to search for keys in a map ([SO](https://stackoverflow.com/a/71306921/125246)):

```bash
kubectl get nodes -o=custom-columns='NAME:.metadata.name,ROLE:TOBEDEFINED,CPU:.status.capacity.cpu,MEM:.status.capacity.memory,IP:.status.addresses[?(@.type=="InternalIP")].address'
```

Sorted pods in a namespace:

```bash
$(kubectl -n "${namespace}" get deployment --no-headers -o custom-columns=":metadata.name" | sort)
```

Sorted nodes and their nodegroups:

```bash
kubectl get nodes -o custom-columns='name:metadata.name,nodegroup:metadata.labels.eks\.amazonaws\.com\/nodegroup,lt version:metadata.labels.eks\.amazonaws\.com/sourceLaunchTemplateVersion,version:status.nodeInfo.kubeletVersion,created:metadata.creationTimestamp' --sort-by=metadata.creationTimestamp
```

or filter and get only the name:

```bash
kubectl get nodes -o custom-columns='name:metadata.name,nodegroup:metadata.labels.eks\.amazonaws\.com\/nodegroup,created:metadata.creationTimestamp' --sort-by=metadata.creationTimestamp | grep wrk-compute | cut -w -f 1
```

Running Jupyter notebooks (using `awk '$3 == "1"'` to filter on the 3rd column where value is 1 ([SO](https://unix.stackexchange.com/a/31755/32390))

```bash
kubectl get notebooks -A -o custom-columns='namespace:metadata.namespace,name:metadata.name,readyReplicas:status.readyReplicas' --sort-by=metadata.namespace | awk '$3 == "1"'
```

Deployments not owned by ArgoCD or Pulumi

```bash
kubectl get deployments --all-namespaces -o custom-columns='namespace:metadata.namespace,name:metadata.name,argocd:metadata.labels.argocd\.argoproj\.io/instance,managed-by:metadata.labels.app\.kubernetes\.io/managed-by,ownerref:metadata.ownerReferences[0].name' --sort-by=metadata.namespace --selector='!argocd.argoproj.io/instance,app.kubernetes.io/managed-by!=pulumi'
```

Deployments owned by ArgoCD

```bash
kubectl get deployments --all-namespaces -o custom-columns='namespace:metadata.namespace,name:metadata.name,argocd:metadata.labels.argocd\.argoproj\.io/instance,managed-by:metadata.labels.app\.kubernetes\.io/managed-by' --sort-by=metadata.namespace --selector='argocd.argoproj.io/instance'
```

Deployments owned by Pulumi

```bash
kubectl get deployments --all-namespaces -o custom-columns='namespace:metadata.namespace,name:metadata.name,argocd:metadata.labels.argocd\.argoproj\.io/instance,managed-by:metadata.labels.app\.kubernetes\.io/managed-by' --sort-by=metadata.namespace --selector='app.kubernetes.io/managed-by=pulumi'
```

AZs for each PV:

```bash
kubectl get pv -o custom-columns='claim:spec.claimRef.name,node:spec.nodeAffinity.required.nodeSelectorTerms[0].matchExpressions[0].values[0]'
```

## Port forwarding

```bash
# local port:remote port
kubectl port-forward -n my-namespace service/my-service 4444:4444
```

## Dump all k8s configuration

* <https://gist.github.com/negz/c3ee465b48306593f16c523a22015bec>

## Other commands

```bash
revision=$(kubectl -n "${namespace}" get "deployment/$deployment" --no-headers -o custom-columns=":metadata.annotations.deployment\.kubernetes\.io\/revision")
```

## Dry-run and diff

* <https://kubernetes.io/blog/2019/01/14/apiserver-dry-run-and-kubectl-diff/>

## Get events for a deployment ([SO](https://stackoverflow.com/a/69636530/125246))

```bash
kubectl get events --field-selector involvedObject.name=$DEPLOYMENT_NAME -n $NAMESPACE
```