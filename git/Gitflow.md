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

## Configuration

```xml
<plugin>
  <groupId>external.atlassian.jgitflow</groupId>
  <artifactId>jgitflow-maven-plugin</artifactId>
  <version>1.0-m5.1</version>
  <configuration>
    <!-- Enable this to push to origin using SSH keys -->
    <enableSshAgent>true</enableSshAgent>
    <!-- Keep your maven submodules at the same version as the parent POM
         (otherwise get prompoted for each) -->
    <autoVersionSubmodules>true</autoVersionSubmodules>
    <!-- Pushing in-development features to origin allows all devs to see what each othes
         are working on -->
    <pushFeatures>true</pushFeatures>
    <!-- This allows the CI server (e.g. Jenkins) to automatically push new releases to
         origin; you can then either manually deploy them or, if you are doing Continuous
         Deployments, auto-deploy them to prod -->
    <pushReleases>true</pushReleases>
    <!-- Hot Fixes should be pushed to origin as well so that any dev can pick them up -->
    <pushHotfixes>true</pushHotfixes>
    <!-- Prevents deployments from dev workstations so that they can be done by a CI server -->
    <noDeploy>true</noDeploy>
    <!-- Allow SNAPSHOT dependencies (if false then fail the build if there are any) -->
    <allowSnapshots>true</allowSnapshots>
    <flowInitContext>
        <masterBranchName>master</masterBranchName>
        <developBranchName>develop</developBranchName>
        <featureBranchPrefix>feature/</featureBranchPrefix>
        <releaseBranchPrefix>release/</releaseBranchPrefix>
        <hotfixBranchPrefix>hotfix/</hotfixBranchPrefix>
        <versionTagPrefix>blither-</versionTagPrefix>
    </flowInitContext>
  </configuration>
</plugin>
```

## Workflow

* [Article with good config](http://george-stathis.com/2013/11/09/painless-maven-project-releases-with-maven-gitflow-plugin/)

### [Start a new feature](https://bitbucket.org/atlassian/jgit-flow/wiki/goals/feature-start)
```bash
mvn jgitflow:feature-start
# Will be prompted to enter a new feature name

# Batch mode (-B or --batch-mode) will not prompt
mvn --batch-mode jgitflow:feature-start -DfeatureName=my-feature-namae
```
This will create a remote-tracking branch (from develop) called `feature/my-feature-name` for the feature and check it out.

### [Finish a feature](https://bitbucket.org/atlassian/jgit-flow/wiki/goals/feature-finish)
```bash
mvn jgitflow:feature-finish
# Will be prompted to select the feature

# Or non-interactively
mvn --batch-mode jgitflow:feature-finish -DfeatureName=my-feature-namae
```
This will:
* Compile and run unit tests in the feature branch, and install the generated artifact (locally).
* Checkout `develop`, then merge in changes from the feature branch.
    * If the merge fails (due to conflicts) then `feature-finish` will fail with an error and you will have to resolve the conflicts.

### [Prepare a release](https://bitbucket.org/atlassian/jgit-flow/wiki/goals/release-start)
```bash
mvn jgitflow:release-start
# Will be prompted to enter the release version number and next development version number

# Batch mode (-B or --batch-mode) will not prompt
mvn --batch-mode jgitflow:release-start -DreleaseVersion=4.0.0 -DdevelopmentVersion=4.0.1
```

This will:
* Create a new `release/<releaseVersion>` remote-tracking branch and update the pom version to `<releaseVersion>-SNAPSHOT`.
* Checkout the `develop` branch and update the pom version with the new `<developmentVersion>-SNAPSHOT`.
* Checkout the new release branch.

### [Finish a release](https://bitbucket.org/atlassian/jgit-flow/wiki/goals/release-finish)
```bash
mvn jgitflow:release-finish

# Don't delete the release branch (you'll need to do that manually)
mvn jgitflow:release-finish -DkeepBranch=true
```
This will:
* Update the release branch's pom to remove the `-SNAPSHOT` version (and any other) suffix.
* Build, test, javadoc, source, install (or deploy)
* Merge the release branch into `master` (will fail if there is a conflict)
* Merge `master` back into `develop` (will fail if there is a conflict)
    * Adds commits to `develop` before the merge to change the pom version to that in `master`
      (to avoid a conflict), and after the merge to change it back to the latest SNAPSHOT version.

Note that the install/release of the built artifact is done from the release branch (not master), so in theory there
could be differences if changes were made in master that were not merged back into develop/release.  However, that should never be allowed to happen (no changes should be made in master directly)!
