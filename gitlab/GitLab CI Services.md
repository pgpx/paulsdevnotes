# GitLab CI Services

* <https://docs.gitlab.com/ci/services/>

Containers that also run alongside the job pod, e.g. for databases.

* Service name is used as the hostname ([ref](https://docs.gitlab.com/ci/services/#how-services-are-linked-to-the-job)).
* Waits for the service ports to be opened (before the timeout).
* Services start before the `before_script` runs, so can use that to query the service.
* Stop at the end of the job (even if the job fails).

## Shared /builds directory ([ref](https://docs.gitlab.com/ci/services/#shared-builds-directory))

* The job checks the project out into `/builds/$CI_PROJECT_PATH`, and this is shared between the job and services.
* Service **must wait** for the directory to be available and `$CI_COMMIT_SHA` to be set:

    > If so, wait for the directory to exist and for $CI_COMMIT_SHA to be checked out. Any changes made before the job finishes its checkout process are removed by the checkout process.

## Capturing service container logs ([ref](https://docs.gitlab.com/ci/services/#capturing-service-container-logs))

To save service logs into the job log (though will not mask secrets):

```yaml
variables:
  CI_DEBUG_SERVICES: "true"
```

## Extended Configuration ([ref](https://docs.gitlab.com/ci/docker/using_docker_images/#extended-docker-configuration-options))

```yaml
services:
  - name: postgres:11.7
    alias: db
    entrypoint: ["docker-entrypoint.sh"]
    command: ["postgres"]
    variables:
      POSTGRES_PASSWORD: supersecretpassword
    pull_policy: always # (default), or if-not-present, never
```

Can set requests and limits for each service ([ref](https://docs.gitlab.com/runner/executors/kubernetes/#overwrite-service-containers-resources)):

```yaml
services:
  - name: postgres:11.7
    variables:
      KUBERNETES_SERVICE_CPU_REQUEST: "3"
      KUBERNETES_SERVICE_CPU_LIMIT: "6"
      KUBERNETES_SERVICE_MEMORY_REQUEST: "3Gi"
      KUBERNETES_SERVICE_MEMORY_LIMIT: "6Gi"
      KUBERNETES_EPHEMERAL_STORAGE_REQUEST: "2Gi"
      KUBERNETES_EPHEMERAL_STORAGE_LIMIT: "3Gi"
```

Use `DOCKER_AUTH_CONFIG` with the contents of `.docker/config.json` to authenticate with private registries ([ref](https://docs.gitlab.com/ci/docker/using_docker_images/#determine-your-docker_auth_config-data)) 

## Service readiness

By default waits for any port to be available, but can specify a specific port with `HEALTHCHECK_TCP_PORT` ([ref in Define a list of services](HEALTHCHECK_TCP_PORT) and [How GitLab Runner performs the services health check](https://docs.gitlab.com/runner/executors/docker/#how-gitlab-runner-performs-the-services-health-check))