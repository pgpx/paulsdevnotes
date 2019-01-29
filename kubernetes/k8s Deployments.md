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

## Issues

* [Force pods to re-pull an image without changing the image tag #33664](https://github.com/kubernetes/kubernetes/issues/33664)
    * <https://stackoverflow.com/questions/40366192/kubernetes-how-to-make-deployment-to-update-image>