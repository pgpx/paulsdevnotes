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

## ANSI colours and collapsible sections

[Change the output colour of echo](https://stackoverflow.com/a/5947802/125246)

* [ANSI escape codes](https://en.wikipedia.org/wiki/ANSI_escape_code) - see 3-bit and 4-bit section.

```
Black        0;30     Dark Gray     1;30
Red          0;31     Light Red     1;31
Green        0;32     Light Green   1;32
Brown/Orange 0;33     Yellow        1;33
Blue         0;34     Light Blue    1;34
Purple       0;35     Light Purple  1;35
Cyan         0;36     Light Cyan    1;36
Light Gray   0;37     White         1;37
```

```bash
RED='\033[0;31m'
NC='\033[0m' # No Color
printf "I ${RED}love${NC} Stack Overflow\n"
```

[Custom collapsible sections](https://docs.gitlab.com/ee/ci/jobs/#custom-collapsible-sections) - use `section_start` and `section_end`:

```yaml
- |
  export RED='\033[30;41m'; export CYAN='\033[36;1m'; export NO_COL='\033[0m'
  function section_start() { echo -e "\e[0Ksection_start:`date +%s`:$1[collapsed=true]\r\e[0K$2"; }
  function section_end() { echo -e "\e[0Ksection_end:`date +%s`:$1\r\e[0K"; }
- |
  section_start scanning "${CYAN}Scanning...${NO_COL}"
  /anchore-cli/anchore_ci_tools.py --analyze --report --image "${BUILT_IMAGE}" --timeout "$ANCHORE_TIMEOUT"
  section_end scanning
```