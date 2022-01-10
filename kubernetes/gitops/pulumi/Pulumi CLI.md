# Pulumi CLI

Login to Pulumi:

```bash
export PULUMI_CONFIG_PASSPHRASE=${password}
pulumi login s3://pulumi-my-AWS-bucket/
pulumi stack select my-stack
```

Diff the generated configuration:

```bash
pulumi preview --diff  #--debug
```

Render the resource dependency graph:

```bash
pulumi stack graph local/dev.dot
dot -Tsvg local/dev.dot > local/dev.svg
```