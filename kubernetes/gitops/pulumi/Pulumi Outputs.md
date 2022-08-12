# Pulumi Outputs

# ApplyT with *PtrInput
Conditionally output a data structure if an output is non-nil (have to use `All` to handle the case where `size` is nil :

```go
// size is a pulumi.IntPtrInput
mappings := pulumi.All(size).ApplyT(
    func(args []interface{}) []ec2.LaunchTemplateBlockDeviceMapping {
        if args[0] != nil { // TODO is there a better way to handle nil?
            size := args[0].(*int)
            return []ec2.LaunchTemplateBlockDeviceMapping{
            // ... 
            }
        } else {
            return []ec2.LaunchTemplateBlockDeviceMapping{}
        }
}).(ec2.LaunchTemplateBlockDeviceMappingArrayOutput)
```
