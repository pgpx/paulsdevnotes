# git-flow

* [Vincent Driessen's branching model](http://nvie.com/posts/a-successful-git-branching-model/)
* [Atlassian explanation](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)
* [Git extensions](https://github.com/nvie/gitflow)
* [JGit Flow Maven Plugin](http://jgitflow.bitbucket.org/)

## [JGit Flow Maven Plugin](http://jgitflow.bitbucket.org/)

* [Wiki](https://bitbucket.org/atlassian/jgit-flow/wiki/Home),
  [Goals Guide](https://bitbucket.org/atlassian/jgit-flow/wiki/goals.wiki)
* [Mojo Documentation](http://jgitflow.bitbucket.org/plugin-info.html)
* [Source](https://bitbucket.org/atlassian/jgit-flow/src)

## Workflow

* [Article with good config](http://george-stathis.com/2013/11/09/painless-maven-project-releases-with-maven-gitflow-plugin/)

### Start a new feature
```bash
mvn jgitflow:feature-start
# Will be prompted to enter a new feature name
```
This will create a remote-tracking branch (from develop) for the feature and check it out.

### Finish a feature
```bash
mvn jgitflow:feature-finish
# Will be prompted to select the feature
```
This will merge from develop, run tests, then merge back into develop, commit, push. and delete the feature branch.


