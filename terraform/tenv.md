# tenv

> OpenTofu, Terraform, Terragrunt, Terramate and Atmos version manager, written in Go.

* <https://tofuutils.github.io/tenv/>

## Terraform

```bash
# List available remote versions
tenv tf list-remote

# List locally-installed versions
tenv tf list

# Install a version
tenv tf install 1.13.4

# Detect the version to use
tenv tf detect

# Write a version constraint to .terraform-version
tenv tf use -w 1.13.4
```