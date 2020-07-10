# GitLab CI YAML

* [GitLab CI YAML reference](https://docs.gitlab.com/ce/ci/yaml/README.html)

Issues:
* [The include keyword does not parse CI variables](https://gitlab.com/gitlab-org/gitlab/issues/24811)

## Git strategy

* [include ref](https://docs.gitlab.com/ee/ci/yaml/README.html#include)
* <https://docs.gitlab.com/ce/ci/yaml/README.html#git-strategy>

Don't fetch/clone Git if the job only uses whatever is in the Docker image and env variables

```yaml
myjob:
  variables:
    # Don't need an up-to-date working copy for this job because it only uses files in the Docker image
    GIT_STRATEGY: none
```

## Includes

* [Include examples](https://docs.gitlab.com/ee/ci/yaml/includes.html)


Include pipeline templates from another repository (on the same GitLab server):

```yaml
include:
  - project: '/shared/gitlab/gitlab-ci-templates'
    ref: 1.0.0
    file: '/maven-docker-build.yml`
```

* Can still replace values in the included jobs ([ref](https://docs.gitlab.com/ee/ci/yaml/includes.html#overriding-external-template-values)).  Note that dictionaries are merged, but list values are replaced completely.  e.g. to replace _all_ of the artifact paths for a job:

```yaml
compile:
  artifacts:
    paths:
      - target/pom.version
      - target/classes/configs/*.*
```