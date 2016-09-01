# Jenkins

* Use Archiving Artifacts / Copy Artifacts to copy files between jobs in the same pipeline (maybe) ([SO](http://stackoverflow.com/a/26535227/125246))
  * Could also use copy workspace, but not sure how that would treat multiple parallel builds.
  * Maybe <http://antagonisticpleiotropy.blogspot.co.uk/2012/02/implementing-real-build-pipeline-with.html>

## Pass a value from a script to Jenkins build steps ([SO](http://stackoverflow.com/a/30128636/125246))

Can't just set environment variables in script steps because they are lost when the script step ends.

Instead, write them to a properties file, and then inject that into the subsequent step:

```sh
mkdir -p target
echo "CONTENT_VERSION=$(src/jenkins/content_version.sh)" > target/jenkins-env.properties
```

Then specify `target/jenkins-env.properties` in a `Parameters from properties file` parameters option.
