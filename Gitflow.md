# git-flow

* [Vincent Driessen's branching model](http://nvie.com/posts/a-successful-git-branching-model/)
* [Atlassian explanation](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)
* [Git extensions](https://github.com/nvie/gitflow)
* [JGit Flow Maven Plugin](http://jgitflow.bitbucket.org/)

## [JGit Flow Maven Plugin](http://jgitflow.bitbucket.org/)

* [Wiki](https://bitbucket.org/atlassian/jgit-flow/wiki/Home),
  [Goals Guide](https://bitbucket.org/atlassian/jgit-flow/wiki/goals.wiki)
* [Mojo Documentation](http://jgitflow.bitbucket.org/plugin-info.html)
* [Source](https://bitbucket.org/atlassian/jgit-flow/src) ([mojos](https://bitbucket.org/atlassian/jgit-flow/src/815fa8e0b44acbaf3afff7c46c55d334f661d4bd/jgitflow-maven-plugin/src/main/java/com/atlassian/maven/plugins/jgitflow/mojo/?at=develop))

## Workflow

* [Article with good config](http://george-stathis.com/2013/11/09/painless-maven-project-releases-with-maven-gitflow-plugin/)

### Start a new feature
```bash
mvn jgitflow:feature-start
# Will be prompted to enter a new feature name

# Batch mode (-B or --batch-mode) will not prompt
mvn --batch-mode jgitflow:feature-start -DfeatureName=my-feature-namae
```
This will create a remote-tracking branch (from develop) called `feature/my-feature-name` for the feature and check it out.

### Finish a feature
```bash
mvn jgitflow:feature-finish
# Will be prompted to select the feature
```
This will:
* Compile and run unit tests in the feature branch, and install the generated artifact (locally).
* Merge from develop, run tests, then merge back into develop, commit, push. and delete the feature branch.

* If the merge fails (due to conflicts) then `feature-finish` will fail with an error and you will have to resolve the conflicts.

