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
* [`@DataProvider`](http://testng.org/javadocs/org/testng/annotations/DataProvider.html) - method supplies test data.  Returns `Object[][]`, where each `Object[]` can be assigned the parameter list of the test method??
* [`@Factory`](http://testng.org/javadocs/org/testng/annotations/Factory.html) - returns objects (`Object[]`) to be used as test classes.
* [`@Listeners`](http://testng.org/javadocs/org/testng/annotations/Listeners.html) - defines listeners ([`ITestNGListener`](http://testng.org/javadocs/org/testng/ITestNGListener.html)) on a test class.
* [`@Parameters({ "xmlPath" })`](http://testng.org/javadocs/org/testng/annotations/Parameters.html) - describes how to pass parameters to a [`@Test`](http://testng.org/javadocs/org/testng/annotations/Test.html) method (which are defined in the `testng.xml` file, e.g. `<parameter name="xmlPath" value="account.xml" />`
* [`@Test`](http://testng.org/javadocs/org/testng/annotations/Test.html) - marks a class or method as part of the test.
  * [`alwaysRun = false`](http://testng.org/javadocs/org/testng/annotations/Test.html#alwaysRun--) - if true, run even if it depends on a method that failed.
  * [`dataProvider`](http://testng.org/javadocs/org/testng/annotations/Test.html#dataProvider--) - name of the [`@DataProvider`](http://testng.org/javadocs/org/testng/annotations/DataProvider.html) to use.
  * [`dataProviderClass`](http://testng.org/javadocs/org/testng/annotations/Test.html#dataProviderClass--) - class where to look for the data provider (defaults to the current class or its parents).
  * [`dependsOnGroups`](http://testng.org/javadocs/org/testng/annotations/Test.html#dependsOnGroups--), [`dependsOnMethods`](http://testng.org/javadocs/org/testng/annotations/Test.html#dependsOnMethods--)
  * [`enabled = true`](http://testng.org/javadocs/org/testng/annotations/Test.html#enabled--) - don't run if false.
  * [`expectedExceptions`](http://testng.org/javadocs/org/testng/annotations/Test.html#expectedExceptions--) - fail if no excpetion is thrown or isn't one of these.
    * [`expectedExceptionsMessageRegExp`](http://testng.org/javadocs/org/testng/annotations/Test.html#expectedExceptionsMessageRegExp--)
  * [`groups`](http://testng.org/javadocs/org/testng/annotations/Test.html#groups--) - list of groups that this class/method belongs to.  Tests can select which groups to run ([ref](http://testng.org/doc/documentation-main.html#test-groups))
  * [`ignoreMissingDependencies`](http://testng.org/javadocs/org/testng/annotations/Test.html#ignoreMissingDependencies--)
  * [`invocationCount = 1`](http://testng.org/javadocs/org/testng/annotations/Test.html#invocationCount--) - repeat the test.
  * [`invocationTimeout = 0L`](http://testng.org/javadocs/org/testng/annotations/Test.html#invocationTimeOut--) - maximum total time (ms) for all invocations in `invocationCount`.
  * [`priority = 0`](http://testng.org/javadocs/org/testng/annotations/Test.html#priority--) - lower priorities will be scheduled first.
  * [`successPercentage = 100`](http://testng.org/javadocs/org/testng/annotations/Test.html#successPercentage--) - percentage success expected from this method.
  * [`singleThreaded = true`](http://testng.org/javadocs/org/testng/annotations/Test.html#singleThreaded--) - all methods in this class wil execute on the same thread, even if tests are run with `parallel="methods"`.
  * [`timeout = 0L`](http://testng.org/javadocs/org/testng/annotations/Test.html#threadPoolSize--) - fail the test after milliseconds.
  * [`threadPoolSize = 0`](http://testng.org/javadocs/org/testng/annotations/Test.html#timeOut--) - size of the thread pool used for `invocationCount`.

## [`testng.xml`](http://testng.org/doc/documentation-main.html#testng-xml)

* [DTD](http://testng.org/testng-1.0.dtd) ([HTML](http://testng.org/testng-1.0.dtd.html))

```xml
<!DOCTYPE suite SYSTEM "http://testng.org/testng-1.0.dtd" >
  
<suite name="Suite1" verbose="1" >
  <test name="Nopackage" preserve-order="false">
    <!-- Select groups -->
    <groups>
      <!-- Groups can include groups -->
      <define name="functest">
        <include name="windows"/>
        <include name="linux"/>
      </define>
      <run>
        <exclude name="brokenTests"  />
        <include name="checkinTests"  />
        <include name="functest"  />
      </run>
    </groups>
    <!-- Specify class names -->
    <classes>
      <class name="NoPackageTest" />
      <class name="test.IndividualMethodsTest">
        <methods>
          <include name="testMethod" />
        </methods>
      </class>
    </classes>
    <!-- or packages -->
    <packages>
      <package name="test.sample" />
    </packages>
  </test>
 
  <!-- Multiple tests -->
  <test name="Regression1">
    <classes>
      
      <class name="test.sample.ParameterTest"/>
    </classes>
  </test>
</suite>
```

## [Running TestNG](http://testng.org/doc/documentation-main.html#running-testng)

`java org.testng.TestNG testng1.xml [testng2.xml testng3.xml ...]`

* `-groups=group1,group2` - which groups to run.
* `-methods=method1,method2` - which methods to run.
* `-testnames=test1,test2` - names of tests to run (from `testng.xml`).

## [Test methods, Test classes and Test groups](http://testng.org/doc/documentation-main.html#methods)
