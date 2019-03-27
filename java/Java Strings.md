# Java Strings

* Don't need to use `StringBuilder` any more for simple (predefined) concatenations since Java 8 - the compiler will do that for us.  ([ref](http://www.pellegrino.link/2015/08/22/string-concatenation-with-java-8.html) and [ref](https://dzone.com/articles/string-concatenation-performacne-improvement-in-ja))

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