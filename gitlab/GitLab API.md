# GitLab API

* <https://github.com/flegall/gitlab-ci-pipeline-queue>

* [Pipelines API](https://docs.gitlab.com/ee/api/pipelines.html)

    e.g. <https://gitlab.com/api/v4/projects/my%2Fproject/pipelines.json>
    
Trigger other pipelines and wait for them to finish: <https://gitlab.com/finestructure/pipeline-trigger>


Delete a job ([SO](https://stackoverflow.com/a/48962177/125246)):

```bash
curl --request POST --header "PRIVATE-TOKEN:<api-token>" https://gitlab.com/api/v4/projects/<project-id>/jobs/<job-id>/erase
```