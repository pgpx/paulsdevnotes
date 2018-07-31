# Java Strings

* Split on commas using Guava ([SO](https://stackoverflow.com/a/7488710/125246))

    ```java
    List<String> list = Splitter.on(",").splitToList(string)
    // or
    List<String> list = Lists.newArrayList(Splitter.on(" , ").split(string));
    ```

* Normalise newlines ([SO](https://stackoverflow.com/a/3776984/125246))

    ```java
    content.replaceAll("\\r\\n?", "\n")
    ```