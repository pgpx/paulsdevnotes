# ArgoCD CLI

## Using HTTP / insecure ArgoCD installations

Add `--plaintext --insecure` on all CLI calls.

## Login

```bash
`argocd login <domain:port> --username admin # and use the password`
```

## Restart deployments

Will create new pods and delete the old ones, which can pull new images if the deployments have `imagePullPolicy: Always`:

```bash
# All deployments
argocd app actions run  my-app restart --kind Deployment --all

# Specific deployment
argocd app actions run my-app restart --kind Deployment --resource-name deployment-name
```

## Wait for k8s operations to complete

```bash
argocd --plaintext --insecure app wait my-app --timeout 600 --health --operation --sync
```