# Java Parameterised tests

* [JUnit Parameterized tests](https://github.com/junit-team/junit4/wiki/Parameterized-tests)

### [JUnitParams](http://pragmatists.github.io/JUnitParams/)

* [GitHub](https://github.com/Pragmatists/JUnitParams)
* [SamplesOfUsageTest.java](https://github.com/Pragmatists/JUnitParams/blob/master/src/test/java/junitparams/usage/SamplesOfUsageTest.java)
* [Quickstart](https://github.com/Pragmatists/junitparams/wiki/Quickstart)

```java
@RunWith(JUnitParamsRunner.class)
public class PersonTest {
...  // Parameters in annotation
@Test
@Parameters({ 
        "17, false", 
        "22, true" })
public void personIsAdult(int age, boolean valid) throws Exception {
...  // Parameters in referenced method
}
@Test
@Parameters(method = "adultValues")
public void personIsAdult(int age, boolean valid) throws Exception {
...
// Return an array or iterable of array of parameter values
// Can also be named parametersForX
private Object[] adultValues() {
    return new Object[]{
                 new Object[]{13, false},
                 new Object[]{17, false}, ...
```

It can't:

* Use parameter arrays in-line with @Parameters - you can only have an array of CSV values.  [Cannot have 2D arrays as values in annotations though!](http://stackoverflow.com/a/19135315/125246)
* Use method references instead of method names (in @Parameters(method=))  e.g. could do MyEnum.values(), but can't do that in Java 8 ([no method references in annotations in Java 8](http://mail.openjdk.java.net/pipermail/lambda-dev/2011-August/003833.html))
* Use Iterables or Stream as return values for parameter methods.