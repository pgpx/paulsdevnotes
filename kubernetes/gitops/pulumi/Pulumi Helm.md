# Pulumi Helm

Extract a value from a service created by a Helm chart resource (from [example]( https://github.com/pulumi/examples/blob/master/azure-go-aks-helm/main.go#L44)):

```go
hostname := chart.GetResource("v1/Service", kafkaName+"-external", "kafka").ApplyT(
    func(input interface{}) pulumi.StringPtrOutput {
        return input.(*v1.Service).Status.LoadBalancer().Ingress().Index(pulumi.Int(0)).Hostname()
    }).ApplyT(
    func(input interface{}) (string, error) {
        hostname := input.(*string)
        // FIXME why is ingress.Hostname allowed to be null?
        if hostname != nil {
            return *hostname, nil
        } else {
            return "", errors.New("missing hostname for Kafka ingress " + kafkaName)
        }
    }).(pulumi.StringOutput)
```