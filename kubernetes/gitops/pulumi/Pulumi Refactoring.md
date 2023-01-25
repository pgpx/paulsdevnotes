# Pulumi Refactoring

* Issue: [Support moving resources between projects](https://github.com/pulumi/pulumi/issues/3389)

## Move stack to another project

1. Export the state file from the original project: `pulumi stack export --file my-state.json`
2. Replace the original project's name in the state file with that of the new project.  This will usually be in URNs such as `"urn": "urn:pulumi:dx-shared::pulumi-aws::pulumi:pulumi:Stack::pulumi-aws-dx-shared",` or `"parent"`, `"provider"`, but there may be others (so you may need tweak this editing if the import fails).
3. Login to the new project and stack, and import the modified state file: `pulumi stack import --file my-state.json`
4. Refresh the state file in case you've accidentally changed non-URN values (e.g. tags with the project name) so that it matches the real state: `pulumi refresh`
5. Run `pulumi up` or `pulumi preview`, and check that only expected differences are shown, and not that all of the resources are deleted and recreated.

In theory we can use `pulumi stack rename <org>/<project-name>/<stack-name>`, but that is not supported by the S3 backend ([GitHub issue #3052](https://github.com/pulumi/pulumi/issues/3052) closed for [#2522](https://github.com/pulumi/pulumi/issues/2522))