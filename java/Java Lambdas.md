# Java Lambdas

* Java 8 [Docs](http://docs.oracle.com/javase/8/docs/), [API](http://docs.oracle.com/javase/8/docs/api/index.html)
* [Java Tutorial](http://docs.oracle.com/javase/tutorial/java/javaOO/lambdaexpressions.html)

Concatenate arrays: ([SO](http://stackoverflow.com/a/35315750/125246)):

```java
public String[] concatString(String[] a, String[] b){ 
    Stream<String> streamA = Arrays.stream(a);
    Stream<String> streamB = Arrays.stream(b);
    return Stream.concat(streamA, streamB).toArray(String[]::new); 
}
```

Could have used Commons Lang [`ArrayUtils.addAll(T[], T...)`](http://commons.apache.org/proper/commons-lang/javadocs/api-3.1/org/apache/commons/lang3/ArrayUtils.html#addAll%28T%5B%5D,%20T...%29) [SO](http://stackoverflow.com/a/80559/125246)

Method references

* [Java tutorial](http://docs.oracle.com/javase/tutorial/java/javaOO/methodreferences.html)
* [Examples / explanation](http://baddotrobot.com/blog/2014/02/18/method-references-in-java8/)
* [No method references in annotations in Java 8](http://mail.openjdk.java.net/pipermail/lambda-dev/2011-August/003833.html)