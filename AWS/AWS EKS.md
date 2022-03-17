# AWS EKS

* [Creating an IAM role and policy for your service account](https://docs.aws.amazon.com/eks/latest/userguide/create-service-account-iam-policy-and-role.html)

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