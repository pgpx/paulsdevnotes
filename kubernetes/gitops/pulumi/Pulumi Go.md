# Pulumi Go

* [Modules example](https://github.com/pulumi/examples/blob/master/aws-go-s3-folder-component/s3folder.go)
* [Debugging issue](https://github.com/pulumi/pulumi/issues/1372#issuecomment-948389020)

## Logging

```go
policy.Arn.ApplyT(func(s string) error {
		ctx.Log.Warn("policy: "+s, nil)
		return nil
	})
```