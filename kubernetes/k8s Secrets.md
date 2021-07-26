# k8s Secrets

* <https://kubernetes.io/docs/concepts/configuration/secret/>

Copy a secret from another namespace ([SO](https://stackoverflow.com/a/58235551/125246)):

```bash
kubectl get secret my-secret  --namespace default -o yaml |\
sed s/"namespace: default"/"namespace: target-ns"/ |\
kubectl apply --namespace=target-ns -f -
```

## Bitnami Sealed Secrets

* <https://github.com/bitnami-labs/sealed-secrets>

Encrypt your Secret into a SealedSecret, which is safe to store - even to a public (Git) repository. The SealedSecret can be decrypted only by the controller running in the target cluster and nobody else (not even the original author) is able to obtain the original Secret from the SealedSecret.