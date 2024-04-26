# Terraform Refactoring

* [Renaming resources](https://developer.hashicorp.com/terraform/language/modules/develop/refactoring#renaming-a-resource)

```terraform
moved {
  from = aws_instance.a
  to   = aws_instance.b
}
```