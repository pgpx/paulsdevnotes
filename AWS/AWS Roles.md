# AWS Roles

## Assume a role

* [How do I assume an IAM role using the AWS CLI?](https://aws.amazon.com/premiumsupport/knowledge-center/iam-assume-role-cli/)

Role must have a [trust relationship](https://docs.aws.amazon.com/eks/latest/userguide/associate-service-account-role.html), e.g. with a user:

```json
{
    "Action": "sts:AssumeRole",
    "Effect": "Allow",
    "Principal": {
        "AWS": "arn:aws:iam::<account>:user/my-user",
    }
}
```

Can then get credentials to assume a role:

```bash
aws sts assume-role --role-arn <role-arn> --role-session-name <comment>
```

After setting env vars, can use `aws sts get-caller-identity` to check current credentials.