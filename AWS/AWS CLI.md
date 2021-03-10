# AWS CLI

* [Homepage](https://docs.aws.amazon.com/cli/index.html#lang/en_us)
* [User Guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)
* [Installation](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)

## Troubleshooting

### [How do I resolve an unauthorized server error when I connect to the Amazon EKS API server?](https://aws.amazon.com/premiumsupport/knowledge-center/eks-api-server-unauthorized-error/)

```bash
kubectl get ns
error: You must be logged in to the server (Unauthorized)
```

Check the current AWS CLI identity: `aws sts get-caller-identity` - you might have the wrong AWS environment variables set (e.g. `AWS_REGION`, `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`)


