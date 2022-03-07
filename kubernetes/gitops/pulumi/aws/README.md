# Pulumi AWS

# AWS Classic

* <https://www.pulumi.com/registry/packages/aws/>

## SSH onto an EC2 instance

Get the SSH private key from a config secret:

```bash
pulumi config get privateKey > ~/.ssh/my-kp.pem
chmod ~/.ssh/my-kp.pem 
ssh -i "~/.ssh/my-kp.pem" ec2-user@172.1.2.3
```

Or use [mssh](https://pypi.org/project/ec2instanceconnectcli/).