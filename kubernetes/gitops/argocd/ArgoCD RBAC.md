# ArgoCD RBAC

* <https://argo-cd.readthedocs.io/en/stable/operator-manual/rbac/

Helm config:

```yaml
server:
  rbacConfig:
    policy.default: role:readonly
    policy.csv: |
      p, tvr-ci, applications, *, tvr-ci/*, allow
      p, tvr-ci, applications, *, ci-demo/*, allow
      p, role:dev, applications, action/apps/Deployment/restart, tvr-dev/*, allow
      g, mtvr, role:dev
  config:
    # Need to reset password using current admin password
    # argocd account update-password --account mtvr --current-password "$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)" --new-password <new-password>>
    # dev user used by the team to monitor application deployment (read-only)
    accounts.dev: login
    # ci user used by CI pipelines to create/delete applications in the tvr-ci project (only)
    accounts.ci: apiKey
```