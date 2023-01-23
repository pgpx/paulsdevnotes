# Pulumi Go

* <https://hub.docker.com/r/pulumi/pulumi-go>
* [Modules example](https://github.com/pulumi/examples/blob/master/aws-go-s3-folder-component/s3folder.go)
* [Debugging issue](https://github.com/pulumi/pulumi/issues/1372#issuecomment-948389020)
* [Using Go Generics with Pulumi](https://www.pulumi.com/blog/2022-03-31-go-generics-with-pulumi/) ([Issue: Updating internal Go packages to Go 1.18](https://github.com/pulumi/pulumi/issues/9648))

## Logging

```go
policy.Arn.ApplyT(func(s string) error {
		ctx.Log.Warn("policy: "+s, nil)
		return nil
	})
```