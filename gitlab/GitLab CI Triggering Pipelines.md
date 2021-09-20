# GitLab CI Triggering Pipelines

* [pipeline-commander](https://github.com/cfriedt/pipeline-commander) - A hackish tool to trigger a GitLab pipeline and wait for its completion (no longer needed)
* <https://finestructure.co/blog/2017/12/2/gitlab-ci-pipeline-trigger-and-wait>

## Preventing concurrent pipeline runs

Issues:

* [Sequential pipeline execution](https://gitlab.com/gitlab-org/gitlab/-/issues/327213)

In theory, can use `resource_group`s.  But cancelling (via the UI) does not cancel the child pipelines, and they no longer block! [issue](https://gitlab.com/gitlab-org/gitlab/-/issues/273378)

Other tools to workaround:

* <https://gitlab.com/Istador/gitlab-ci-orchestrator>
* <https://gitlab.com/shalomb/gitlab-job-guard>