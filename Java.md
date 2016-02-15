# Java

* Java 8 [Docs](http://docs.oracle.com/javase/8/docs/), [API](http://docs.oracle.com/javase/8/docs/api/index.html)
* JetBrains [Migrating to Java 8](https://www.jetbrains.com/idea/help/tutorial-migrating-to-java-8.html)
## Generics

### PECS - Producer-extends, consumer-super

Ref: ["Effective Java, 2nd ed.", Item 28](https://www.safaribooksonline.com/library/view/effective-java/9780137150021/ch05.html#ch05lev1sec6)

For method arguments:
* If the argument is producing values for the method to use, then its type should be `<? extends T>`.
* If the argument will consume (store) values that the method creates, then its type should be `<? super T>`.
* If the argument both produces and consumes values, then its type should just be `T`.

The return type of a method should not generally have wildcards
(just makes it harder to use because clients would also need to use wildcards).

If a type parameter appears only once in a method declaration, replace it with a wildcard.

* Might need to add a private helper to capture the wildcard type if it is needed in the implementation
(which allows the simple wildcard-based declaration to be used by clients).

```java
public static void swap(List<?> list, int i, int j) {
    swapHelper(list, i, j);
}

// Private helper method for wildcard capture
private static <E> void swapHelper(List<E> list, int i, int j) {
    list.set(i, list.set(j, list.get(i)));
}
```

## Lambdas

* [Java Tutorial](http://docs.oracle.com/javase/tutorial/java/javaOO/lambdaexpressions.html)
