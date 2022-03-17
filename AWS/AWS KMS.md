# AWS KMS

* [Authentication and access control for AWS KMS](https://docs.aws.amazon.com/kms/latest/developerguide/control-access.html)
* [Best Practices PDF](https://d1.awsstatic.com/whitepapers/aws-kms-best-practices.pdf)
* [Actions, resources, and condition keys for AWS Key Management Service](https://docs.aws.amazon.com/service-authorization/latest/reference/list_awskeymanagementservice.html)

## Encrypt and decrypt

```bash
aws kms decrypt --key-id <key-arn> --ciphertext-blob \
  $(aws kms encrypt --key-id <key-arn> --plaintext 'hello' --output text --query CiphertextBlob)
```

## Rotation

AWS automatically rotates keys ([ref](https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html)), but saves all previous previous versions so that you can still decrypt previously-encrypted data.