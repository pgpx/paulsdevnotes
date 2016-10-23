# Java Annotations

* [Java Language Spec](https://docs.oracle.com/javase/specs/jls/se8/html/jls-9.html#jls-9.7)
* [Java Tutorial](https://docs.oracle.com/javase/tutorial/java/annotations/index.html)
* [No method references in annotations in Java 8](http://mail.openjdk.java.net/pipermail/lambda-dev/2011-August/003833.html)

Annotation values can be:
* Primitive type or String
* Class or an invocation of Class (class literal)
* Enum constant
* Conditional expression
* Must be not null (when assigned)

Cannot be:

* 2D array ([SO](http://stackoverflow.com/a/19135315/125246))
* Object