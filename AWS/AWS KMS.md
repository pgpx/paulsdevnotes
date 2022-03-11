# AWS KMS

* [Authentication and access control for AWS KMS](https://docs.aws.amazon.com/kms/latest/developerguide/control-access.html)
* [Best Practices PDF](https://d1.awsstatic.com/whitepapers/aws-kms-best-practices.pdf)

## Rotation

AWS automatically rotates keys ([ref](https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html)), but saves all previous previous versions so that you can still decrypt previously-encrypted data.