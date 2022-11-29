# Pulumi ApplyT

Try not to create resources within `.ApplyT` because preview may not work correctly, but sometimes this cannot be avoided (e.g. when creating resources for each value in an input/output array).

* Creating resources in `pulumi.All(...).ApplyT(` does not seem to show the resources in preview.
* Creating resources in `myMap.ToStringMapOutput().ApplyT(func(kvMap map[string]string) ([]*autoscaling.Tag, error) {` does show resources in preview.