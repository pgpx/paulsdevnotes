# Pulumi Importing

## Importing existing resources

[My experience migrating my infrastructure from Terraform to Pulumi - Importing a resource that has a parent was a bit confusing at first](https://blog.ekik.org/my-experience-migrating-my-infrastructure-from-terraform-to-pulumi)

URN breakdown:

```
urn:pulumi:<stack-name>::<project-name>::parent-resource-type>$<resource-type>::<resource-name>
```

e.g.

```
urn:pulumi:prod::VT::vt:RedisServer$aws:elasticache/parameterGroup:ParameterGroup::vt-redis-prod
```

* *stack name* - prod
* *project name* - VT
* *parent resource type* - vt:RedisServer
* *resource type* - aws:elasticache/parameterGroup:ParameterGroup
* *resource name* - vt-redis-prod

To import:

* Ensure that the parent component exists by updating only the parent (if it does not already exist): `pulumi up --target urn:pulumi:prod::VT::vt:RedisServer::vt-redis-prod`
* Import the resource with a reference to its parent, where:
  * key is the variable name used in your code):
* value is the URN of the parent component, which you can get with `pulumi stack --show-urns`.

    ```bash
    # Executing the import (the right way)
    pulumi import \
    --parent vt_prod_redis_server=urn:pulumi:prod::VT::vt:RedisServer::vt-redis-prod \
    aws:elasticache/parameterGroup:ParameterGroup \
    vt-redis-prod \
    vt-redis-prod
    ```