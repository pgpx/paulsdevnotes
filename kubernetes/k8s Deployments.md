# k8s Deployments

Rollout status - will wait for deployment to finish ([SO](https://stackoverflow.com/a/44700438/125246)):

```bash
kubectl rollout status deploy/my-deployment
```

Check multiple deployments:
```bash
# Wait for all of the deployments to complete
for deployment in $(ls -1 "${SCRIPT_DIR_PATH}/base/30_deployment"); do
    kubectl "-n=${NAMESPACE}" rollout status --timeout=60s --watch -f "${SCRIPT_DIR_PATH}/base/30_deployment/$deployment"
done
```

Better than checking condition=available because that might include pods from a previous deployment that are still allocated to the service (even if they had an older configuration)

```bash

kubectl "-n=${NAMESPACE}" wait --timeout=30s --for=condition=Available -f "${SCRIPT_DIR_PATH}/base/30_deployment"
```

Also:
* <https://www.reddit.com/r/kubernetes/comments/afieq9/how_to_validate_wait_until_kubernetes_deployment/>
* Video: [Weave & Chick-fil-A: Managing Fleets of Kubernetes Clusters](https://www.youtube.com/watch?v=ta9jJc-RVvE)
* <https://github.com/fluxcd/flux>
* <https://github.com/keel-hq/keel>
* [krane](https://github.com/Shopify/krane) is a command line tool that helps you ship changes to a Kubernetes namespace and understand the result.
* [k8s-handle](https://github.com/2gis/k8s-handle) - k8s-handle is a command line tool that facilitates continuous delivery for Kubernetes applications
* [kapp](https://github.com/k14s/kapp)

* Use `kubectl replace` to delete and re-create the deployment, e.g. to fix broken pods (instead of `kubectl apply` which will just update changed) - a [disruptive update](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/#disruptive-updates)

## Issues

* [Force pods to re-pull an image without changing the image tag #33664](https://github.com/kubernetes/kubernetes/issues/33664)
    * <https://stackoverflow.com/questions/40366192/kubernetes-how-to-make-deployment-to-update-image>
* [kubectl list pods in a deployment](https://github.com/kubernetes/kubernetes/issues/72794) - need a way to get a machine-readable selector that can then be passed as `-l`, but issue was closed.
    
## Canary Deployments

* <https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/#canary-deployments>
* <https://dev.to/mostlyjason/intro-to-deployment-strategies-blue-green-canary-and-more-3a3>
* <https://medium.com/google-cloud/kubernetes-canary-deployments-for-mere-mortals-13728ce032fe>