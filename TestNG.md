# [TestNG](http://www.testng.org)

* [Documentation](http://testng.org/doc/documentation-main.html), [JavaDocs](http://testng.org/javadocs/index.html), [GitHub](https://github.com/cbeust/testng)
* Book: "Next Generation Java Testing: TestNG and Advanced Concepts" ([Safari](https://www.safaribooksonline.com/library/view/next-generation-javatm/9780321503107/))

## Configuration

[Maven](http://testng.org/doc/maven.html):

```xml
<dependency>
  <groupId>org.testng</groupId>
  <artifactId>testng</artifactId>
  <version>6.8</version>
  <scope>test</scope>
</dependency>
```

## Concepts

[ref](http://testng.org/doc/documentation-main.html#introduction)

* *suite* - one XML file, contains 1:m tests, `<suite>` tag.
* *test* - `<test>`, 1:m TestNG classes.
* *TestNG class* - `<class>` - Java class with at least one TestNG annotation.  Can use `@BeforeXXX` and `@AfterXXX`.
* *test method* - Java method annotated with `@Test`.

## [Annotations](http://testng.org/doc/documentation-main.html#annotations)

[`org.testng.annotations`](http://testng.org/javadocs/index.html?org/testng/annotations/package-summary.html)
* `@BeforeXXX` / `@AfterXXX` - before / after...
  * [`Suite`](http://testng.org/javadocs/org/testng/annotations/BeforeSuite.html) - all tests in suite have run
  * [`Test`](http://testng.org/javadocs/org/testng/annotations/BeforeTest.html) - run before/after any/all test methods belonging to the classes in the `<test>` tag.
  * [`Groups`](http://testng.org/javadocs/org/testng/annotations/BeforeGroups.html) - run before/after this list of groups (shortly before/after first test method is invoked).
  * [`Class`](http://testng.org/javadocs/org/testng/annotations/BeforeClass.html) - run before first/after last test method in the current class.
  * [`Method`](http://testng.org/javadocs/org/testng/annotations/BeforeMethod.html) - run before/after each test method.
  * Attributes: `alwaysRun`, `dependsOnGroups`, `dependsOnMethods`, `enabled` (don't run if not), `groups`, `inheritGroups`
* 
