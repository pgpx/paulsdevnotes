# GitLab CI

* [.gitlab-ci.yml](https://docs.gitlab.com/ee/ci/yaml/)
* [Introduction to pipelines and jobs](https://docs.gitlab.com/ee/ci/pipelines.html)
* [Variables](https://docs.gitlab.com/ce/ci/variables/README.html)
* [Triggers](https://docs.gitlab.com/ee/ci/triggers/)
* [Environments](https://docs.gitlab.com/ce/ci/environments.html)
* [Job Artifacts](https://docs.gitlab.com/ce/user/project/pipelines/job_artifacts.html)
* [Examples](https://docs.gitlab.com/ee/ci/examples/)
* [Cache dependencies in GitLab CI/CD](https://docs.gitlab.com/ee/ci/caching/)
* [Blog - CI/CD with GitLab](https://about.gitlab.com/2016/08/05/continuous-integration-delivery-and-deployment-with-gitlab/)
* [Continuous delivery of a Spring Boot application with GitLab CI and Kubernetes](https://about.gitlab.com/2016/12/14/continuous-delivery-of-a-spring-boot-application-with-gitlab-ci-and-kubernetes/)
* [GitLab Runner](https://docs.gitlab.com/runner/)
** [Docker executor](https://docs.gitlab.com/runner/executors/docker.html)
** [Docker volumes not mounted when using docker:dind](https://gitlab.com/gitlab-org/gitlab-ce/issues/41227)
*** [Test build directory shariong](https://gitlab.com/tmaczukin-test-projects/test-builds-directory-sharing/blob/master/.gitlab-ci.yml)
** [Building Docker images with GitLab CI/CD](https://docs.gitlab.com/ee/ci/docker/using_docker_build.html)
** [The Kubernetes executor](https://docs.gitlab.com/runner/executors/kubernetes.html)
* [GitLab Pages](https://docs.gitlab.com/ee/user/project/pages/index.html)
** https://docs.gitlab.com/ee/administration/pages/
** https://about.gitlab.com/2016/12/07/building-a-new-gitlab-docs-site-with-nanoc-gitlab-ci-and-gitlab-pages/
* [~jpetazzo/Using Docker-in-Docker for your CI or testing environment? Think twice.](https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/)  - `-v /var/run/docker.sock:/var/run/docker.sock` instead.

Possible issues:

* [CI runner breaks on activated git-lfs](https://gitlab.com/gitlab-org/gitlab-runner/issues/2245), [CI runner breaks on activated git-lfs (improved solution)](https://gitlab.com/gitlab-org/gitlab-runner/issues/2504)

## Docker configuration

* [Building Docker images with GitLab CI/CD](https://docs.gitlab.com/ee/ci/docker/using_docker_build.html)
    * Shows different runner configurations (shell, docker-in-docker, docker socket binding)
    * Docker layer caching
    
## Registering a runner

```bash
docker exec -it gitlab-runner gitlab-runner register
```

Then to configure it to be able to run Docker commands:

```bash
docker exec -it gitlab-runner bash
vi /etc/gitlab-runner/config.toml
gitlab-runner restart
```

And change the following entries for your new runner:

```yaml
privileged = true
volumes = ["/var/run/docker.sock:/var/run/docker.sock", "/cache"]
```

## Triggering other pipelines

* <https://docs.gitlab.com/ee/ci/triggers/>

## Debugging jobs locally

Can run individual jobs local;y, but cannot yet run multiple jobs or use artifacts.

```bash
brew install gitlab-runner
gitlab-runner exec docker job-name
```

* [How to: Debug GitLab CI Builds Locally](https://substrakt.com/how-to-debug-gitlab-ci-builds-locally/)
* [GitLab Runner Commands](https://docs.gitlab.com/runner/commands/README.html)
* Improvements will come soon: <https://gitlab.com/gitlab-org/gitlab-runner/issues/2797#note_51070788>

## config.toml

Additional configuration for GitLab CI runners.

* [Reference](https://docs.gitlab.com/runner/configuration/advanced-configuration.html)

### Environment variables

Can define environment variables that are accessible by each build (though the builds will overwrite them if they define their own `variables`).
* In the `[[runners]]` section: `environment = ["ENV=value", "LC_ALL=en_US.UTF-8"]`
** Cannot interpolate values here though (e.g. can't do `PATH=$PATH;/other/dir`)
* To append values to a variable, add to the `pre_build_script` in `[[runners]]` ([related issue](https://gitlab.com/gitlab-org/gitlab-runner/issues/1249)), e.g.

    ```
    pre_build_script = "export MAVEN_OPTS=\"$MAVEN_OPTS -Dmaven.repo.local=/var/cache/ci-repository-cache/maven
    ```

Could expose common package manager directory cache directories in this way: <https://www.colinodell.com/blog/201704/optimizing-dockerbased-ci-runners-shared-package-caches>

### Docker runner configuration

In the `[runners.docker]` section of `config.toml`:

    ```
    volumes = ["/cache","ci-repository-cache:/var/cache/ci-repository-cache", ...]
    ```
    
## JUnit Reports

* <https://docs.gitlab.com/ee/ci/yaml/#artifacts-reports-junit>
* <https://docs.gitlab.com/ee/ci/junit_test_reports.html>

Upload JUnit-style XML test reports, and can then show failed tests in merge requests (only).

[Maven example](https://docs.gitlab.com/ee/ci/junit_test_reports.html#maven)

```yaml
java:
  stage: test
  script:
  - mvn verify
  artifacts:
    reports:
      junit:
        - target/surefire-reports/TEST-*.xml
        - target/failsafe-reports/TEST-*.xml
```

### Scripting

GitLab will exit as soon as a command fails - seems like it uses `set -e` ([SO](https://stackoverflow.com/a/39468230/125246)), so:

```bash
set +e # Disable exit on error
command-that-might-fail
EXIT_CODE=$?    # Save the exit code for later
other-command
set -e # Enable exit on error
exit $EXIT_CODE # Re-apply the initial exit code
```