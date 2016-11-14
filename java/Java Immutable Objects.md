# Java Immutable Objects

* [Clean Java Immutability](http://alexsimo.com/clean-java-immutability/)
* [Lombok alternatives for clean code](http://stackoverflow.com/questions/21741166/lombok-alternatives-for-clear-code-without-getters-setters-tostring-constructors)
* [Lombok, Autovalue, and Immutables](https://www.javacodegeeks.com/2016/06/lombok-autovalue-immutables.html)
* [Is it safe to use Project Lombok?](http://stackoverflow.com/questions/3852091/is-it-safe-to-use-project-lombok)
* [Annotation Processing 101](http://hannesdorfmann.com/annotation-processing/annotationprocessing101)

## [Immutables](http://immutables.github.io/)

* [User Guide](http://immutables.github.io/immutable.html)
* [Style Customisation](http://immutables.github.io/style.html)

Customise the builder: ([ref](https://github.com/immutables/immutables/issues/166))

```java
// Subclass the immutable builder and construct a new factory method
@Value.Immutable
public interface Link {
    public static Builder builder() { 
       return new Builder();
    }
    public class Builder extends ImmutableLink.Builder {
         public Builder href(String s) {
             return href(URI.create(s));
         }
    }
}
```

## [Google Auto](https://github.com/google/auto)

* [AutoValue ... what, why and how?](https://docs.google.com/presentation/d/14u_h-lMn7f1rXE1nDiLX0azS3IkgjGl5uxp5jGJ75RE/edit#slide=id.g2a5e9c4a8_00) - presentation.

## [Java Poet](https://github.com/square/javapoet) - Java code generator

## [Joda-Beans](http://www.joda.org/joda-beans/)

* [Code generating beans - mutable and immutable](http://blog.joda.org/2016/09/code-generating-beans.html)

Generates code in the main source file (that is cheked in to your VCS) instead of in an auxiliary file (that is not checked in) - easier for others to work with.

## [Project Lombok](https://projectlombok.org/)

## [VALJOGen](http://valjogen.41concepts.com/)