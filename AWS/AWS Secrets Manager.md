# AWS Secrets Manager

* [Using a hierarchical naming convention for secrets](https://docs.aws.amazon.com/prescriptive-guidance/latest/secure-sensitive-data-secrets-manager-terraform/naming-convention.html)

Force delete a secret (if getting `You can't create this secret because a secret with this name is already scheduled for deletion`) ([ref](https://repost.aws/knowledge-center/delete-secrets-manager-secret)):

```bash
aws secretsmanager list-secrets --include-planned-deletion
aws secretsmanager describe-secret --secret-id your-secret-name --region your-region
aws secretsmanager delete-secret --secret-id your-secret-name --force-delete-without-recovery --region your-region
```