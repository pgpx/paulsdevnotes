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
pulumi preview --diff --show-sames # Also show unchanged resources
```

Render the resource dependency graph:

```bash
pulumi stack graph local/dev.dot
dot -Tsvg local/dev.dot > local/dev.svg
```

Refresh the Pulumi configuration with `pulumi refresh`.
* Related issue: [Consider automatically refreshing on preview/update/destroy]((https://github.com/pulumi/pulumi/issues/2247)) - no reason given why refresh should not be the default.
* Also: `pulumi refresh --show-replacement-steps`