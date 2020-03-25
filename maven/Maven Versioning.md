# Maven Versioning

## Recompute project version based on Git branch

* <https://stackoverflow.com/questions/13583953/deriving-maven-artifact-version-from-git-branch>
* <https://github.com/qoomon/maven-git-versioning-extension>
* <https://github.com/jgitver/jgitver-maven-plugin>

## maven-git-versioning-extension

* [GitHub](https://github.com/qoomon/maven-git-versioning-extension)

Virtually sets project versions based on the current Git branch or Git tag.

## git-commit-id-plugin

* [GitHub](https://github.com/git-commit-id/git-commit-id-maven-plugin)
* [Usage](https://github.com/git-commit-id/git-commit-id-maven-plugin/blob/master/maven/docs/using-the-plugin.md)

Validation usage example ([ref](https://github.com/git-commit-id/git-commit-id-maven-plugin/blob/master/maven/docs/using-the-plugin.md#validation-usage-example)):

```xml
<validationProperties>
  <!-- verify that the project version does not end with `-SNAPSHOT` -->
  <validationProperty>
    <name>validating project version</name>
    <value>${project.version}</value>
    <shouldMatchTo><![CDATA[^.*(?<!-SNAPSHOT)$]]></shouldMatchTo>
    <!-- for future reference on this particular regex, please refer to lookahead and lookbehind expressions -->
    <!-- we could also use: <shouldMatchTo>^[0-9\.]*$</shouldMatchTo> -->
  </validationProperty>
  <!-- verify that the current repository is not dirty -->
  <validationProperty>
    <name>validating git dirty</name>
    <value>${git.dirty}</value>
    <shouldMatchTo>false</shouldMatchTo>
   </validationProperty>
  <!-- verify that the current commit has a tag -->
  <validationProperty>
    <name>validating current commit has a tag</name>
    <value>${git.closest.tag.commit.count}</value>
    <shouldMatchTo>0</shouldMatchTo>
   </validationProperty>
</validationProperties>
```