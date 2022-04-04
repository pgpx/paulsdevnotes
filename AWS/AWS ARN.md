# AWS Amazon Resource Names (ARNs)

* [Amazon Resource Names (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
* [ARN Formats](https://docs.aws.amazon.com/quicksight/latest/APIReference/qs-arn-format.html)

    ```
    arn:partition:service:region:account-id:resource-id
    arn:partition:service:region:account-id:resource-type/resource-id
    arn:partition:service:region:account-id:resource-type:resource-id
    ```

  * `partition` in which the resource is located. A partition is a group of AWS Regions. Each AWS account is scoped to one partition.
    * `aws` - AWS Regions
    * `aws-cn` - China Regions
    * `aws-us-gov` - AWS GovCloud (US) Regions
    * `service` - service namespace that identifies the AWS product. e.g. `s3`To find a service namespace, open the [Service Authorization Reference](https://docs.aws.amazon.com/service-authorization/latest/reference/), open the page for the service, and find the phrase "service prefix" in the first sentence.
  * `region`  code. e.g. `us-east-2` for US East (Ohio). For the list of Region codes, see [Regional endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#regional-endpoints).
  * `account-id` -  ID of the AWS account that owns the resource, without the hyphens. For example, `123456789012`.
  * `resource-id` - resource identifier. This part of the ARN can be the name or ID of the resource or a resource path. For example, `user/Bob` for an IAM user or `instance/i-1234567890abcdef0` for an EC2 instance. Some resource identifiers include a parent resource (`sub-resource-type/parent-resource/sub-resource`) or a qualifier such as a version (`resource-type:resource-name:qualifier`).