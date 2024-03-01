# Terraform Dynamic Blocks

* [Dynamic blocks](https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks)


## Conditionals

Use a dynamic block with a boolean to optionally include the block ([SO](https://stackoverflow.com/a/62032305/125246)):

```terraform
data "aws_iam_policy_document" "policy" {
  statement {
    sid = "PolicyAlways"
    # ...
  }

  dynamic "statement" {
    # The contents of the list below are arbitrary, but must be of length one. 
    # It is only used to determine whether or not to include this statement.
    for_each = var.enable_optional_policy ? [1] : []

    content {
      sid = "PolicySometimes"
      # ...
    }
  }
}
```
