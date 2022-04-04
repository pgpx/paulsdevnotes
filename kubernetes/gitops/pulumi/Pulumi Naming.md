# Pulumi Naming

[Don't name resources unless you really have to](https://blog.ekik.org/my-experience-migrating-my-infrastructure-from-terraform-to-pulumi):

* Pulumi will use the identifier and [append a hex character suffix](https://www.pulumi.com/docs/troubleshooting/faq/#why-do-resource-names-have-random-hex-character-suffixes).
* Allows multiple stacks next to each other, without any naming clashes.
* Allows Pulumi to create a new modified resource before tearing down the original (otherwise teardown has to occur first).