# Maven Site

## Troubleshooting

* To avoid running tests twice for `mvn clean deploy site` ([SO](https://stackoverflow.com/a/23654492/125246)):

    ```xml
    <plugin>
        <artifactId>maven-surefire-report-plugin</artifactId>
        <version>3.0.0-M3</version>
        <reportSets>
            <reportSet>
                <reports>
                    <!-- Avoid compiling and running the tests twice with mvn deploy site -->
                    <report>report-only</report>
                </reports>
            </reportSet>
        </reportSets>
    </plugin>
    ```

* `Error: Could not find or load main class org.apache.maven.surefire.booter.ForkedBooter` ([SO](https://stackoverflow.com/a/53016532/125246)) - just update your `maven-surefire-plugin` version to >= 3.0.0-M1.