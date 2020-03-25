# GitLab CI YAML

* [GitLab CI YAML reference](https://docs.gitlab.com/ce/ci/yaml/README.html)

Issues:
* [The include keyword does not parse CI variables](https://gitlab.com/gitlab-org/gitlab/issues/24811)

## Git strategy

* <https://docs.gitlab.com/ce/ci/yaml/README.html#git-strategy>

Don't fetch/clone Git if the job only uses whatever is in the Docker image and env variables

```yaml
myjob:
  variables:
    # Don't need an up-to-date working copy for this job because it only uses files in the Docker image
    GIT_STRATEGY: none
```