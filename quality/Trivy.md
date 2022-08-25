# Trivy

## Integration with GitLab CI

* [Container-Scanning.gitlab-ci.yml](https://gitlab.com/gitlab-org/gitlab/-/blob/master/lib/gitlab/ci/templates/Security/Container-Scanning.gitlab-ci.yml)

### Parsing / formatting errors

Scan details vulnerability count is 0 if any schema errors (and Security & Compliance will not be updated)

GitLab does some pre-processing for itself:

* [vulnerability.rb](https://gitlab.com/gitlab-org/security-products/analyzers/container-scanning/-/blob/master/lib/gcs/vulnerability.rb)

