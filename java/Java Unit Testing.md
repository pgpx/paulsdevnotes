# Java Unit Testing

* [JUnit 4](http://junit.org/junit4/), [JUnit 5](http://junit.org/junit5/)
* [AssertJ
   Fluent assertions for java](http://joel-costigliola.github.io/assertj/)
* [JUnitToolbox](https://github.com/MichaelTamm/junit-toolbox) - JUnit 4 utils (parallel runs, test selection)
* [12 Tools That I Use for Writing Unit and Integration Tests](https://www.petrikainulainen.net/programming/testing/12-tools-that-i-use-for-writing-unit-and-integration-tests/)
   
## Code coverage

* [Java Code Coverage Tools](https://en.wikipedia.org/wiki/Java_Code_Coverage_Tools)
* [JCov](https://wiki.openjdk.java.net/display/CodeTools/jcov)
* [EclEmma / JaCoCo](http://www.eclemma.org/jacoco/)

## Test data builders

* [Mistaeks I Hav Made: Writing Test Data Builders: Make It Easy on Yourself](http://www.natpryce.com/articles/000769.html)

## Automatic test generation

* [EvoSuite](http://www.evosuite.org/) ([GitHub](https://github.com/EvoSuite/evosuite))

## Test tool libraries

### [AssertJ](http://joel-costigliola.github.io/assertj/)

* [GitHub](https://github.com/joel-costigliola/assertj-core)
* [field-by-field comparisons](http://joel-costigliola.github.io/assertj/assertj-core-features-highlight.html#field-by-field-comparison).
* [Comparison with Fest and Hamcrest](https://www.javacodegeeks.com/2014/10/assertj-fest-hamcrest.html)
* [Turning Assertions Into a Domain-Specific Language](https://www.petrikainulainen.net/programming/unit-testing/turning-assertions-into-a-domain-specific-language/)

### [Hamcrest](http://hamcrest.org/)

* [Java](http://hamcrest.org/JavaHamcrest/), [GitHub](https://github.com/hamcrest/JavaHamcrest)
* [The Hamcrest Tutorial](https://code.google.com/archive/p/hamcrest/wikis/Tutorial.wiki)
* [Using Hamcrest for testing - Tutorial](http://www.vogella.com/tutorials/Hamcrest/article.html#using-hamcrest-beans-matchers)
* [`samePropertyValuesAs`](http://hamcrest.org/JavaHamcrest/javadoc/1.3/org/hamcrest/Matchers.html#samePropertyValuesAs%28T%29)

### [Unitils](http://www.unitils.org/summary.html)

* [assertReflectionEquals](http://www.unitils.org/tutorial-reflectionassert.html).  Use [AssertJ's](http://joel-costigliola.github.io/assertj/) [field-by-field comparisons](http://joel-costigliola.github.io/assertj/assertj-core-features-highlight.html#field-by-field-comparison) instead.
* Doesn't seem to be supported any more ([SO](http://stackoverflow.com/a/34659291/125246)).  [Github mirror](https://github.com/arteam/unitils)