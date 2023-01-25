# AWS EKS

* [Release Calendar](https://docs.aws.amazon.com/eks/latest/userguide/kubernetes-versions.html#kubernetes-release-calendar) - includes end of support dates.
* [Creating an IAM role and policy for your service account](https://docs.aws.amazon.com/eks/latest/userguide/create-service-account-iam-policy-and-role.html)

## Cluster creation

* [Creating an Amazon EKS cluster](https://docs.aws.amazon.com/eks/latest/userguide/create-cluster.html) - user/role that creates the cluster will be its owner, which cannot be changed and is not visible.  Recommendation is to create a new IAM Role for this purpose, and to assume that role when performing the creation.

## Upgrades

* Node upgrades will drain/cordon/terminate nodes in turn ([ref](https://docs.aws.amazon.com/eks/latest/userguide/managed-node-update-behavior.html))
  * Alternative tools (faster?):
    * [EKS RollingUpdate](https://github.com/hellofresh/eks-rolling-update) ([blog](https://engineering.hellofresh.com/open-sourcing-eks-rolling-update-a-tool-for-updating-amazon-eks-clusters-5cef5b497a95))
    * [Amazon Web Services AutoScaling Group Roller](https://github.com/deitch/aws-asg-roller)

## Troubleshooting

* [Kubernetes Cluster Running Out of IP Addresses on AWS EKS](https://medium.com/codex/kubernetes-cluster-running-out-of-ip-addresses-on-aws-eks-c7b8e5dd8606) - increase the size of your CIDRs and watch out for nodes not releasing IPs until all in an ENI are unused.
* [Optimize IP addresses usage by pods in your Amazon EKS cluster](https://aws.amazon.com/blogs/containers/optimize-ip-addresses-usage-by-pods-in-your-amazon-eks-cluster/)

## IAM access

* [Enabling IAM user and role access to your cluster](https://docs.aws.amazon.com/eks/latest/userguide/add-user-role.html)

Have to add users/roles to the `kube-system/aws-auth` configmap (use `eksctl` to do this).  Note that the user who created the cluster will always have access (and this user is hidden in the config, and cannot be changed!).

## API

* [CreateNodegroup](https://docs.aws.amazon.com/eks/latest/APIReference/API_CreateNodegroup.html) - creates a managed node group for an EKS cluster.

## Retrieving Amazon EKS optimized Amazon Linux AMI IDs

[ref](https://docs.aws.amazon.com/eks/latest/userguide/retrieve-ami-id.html)

```bash
aws ssm get-parameter --name /aws/service/eks/optimized-ami/1.21/amazon-linux-2/recommended/image_id --region region-code --query "Parameter.Value" --output text
```

Replace `amazon-linux-2` with `amazon-linux-2-gpu` or `amazon-linux-2-arm64` if required.

## Service accounts and trust relationships

* <https://docs.aws.amazon.com/eks/latest/userguide/create-service-account-iam-policy-and-role.html>

You can tell a container to run using a specific service account (in a specific namespace, instead of the per-namespace default), which can have restricted k8s permissions if required, but can also be linked to an IAM role (via a trust relationship), to give it specific AWS permissions (e.g. to be able to push to ECR or access specific S3 buckets).  By default, all EKS nodes can read (but not write) from the ECR repos of their AWS account, but you'll need to do something else to write to them.  The nice thing about using service accounts in this way is that you then don't need to store ECR credentials anywhere in your k8s configuration - you get read access by default, and specific GitLab runners can run with a service account to get push permissions.

Example trust relationship:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::${ACCOUNT_ID}:oidc-provider/${OIDC_PROVIDER}"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "${OIDC_PROVIDER}:sub": "system:serviceaccount:${namespace}:${service_account}"
        }
      }
    }
  ]
}
```