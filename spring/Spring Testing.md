# [Spring Testing](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#testing)

## [Unit testing](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#unit-testing)

## [Integration testing](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#integration-testing)

...

### [Annotations](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#integration-testing-annotations-spring)

* [`@ContextConfiguration`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/ContextConfiguration.html) - how to load an [`ApplicationContext`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/context/ApplicationContext.html) for integration tests.
  * [`classes = TestConfig.class`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/ContextConfiguration.html#classes--)
  * [`initializers = CustomContextInitializer.class`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/ContextConfiguration.html#initializers--) - for [`ApplicationContextInitializer`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/context/ApplicationContextInitializer.html) classes 
  * [`locations = "classpath:/myconfig.xml`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/ContextConfiguration.html#locations--)
  * [`loader = CustomContextLoader.class`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/ContextConfiguration.html#loader--)
* [`@WebAppConfiguration("file:/src/main/webapp")`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/web/WebAppConfiguration.html) - to load a [`WebApplicationContext`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/context/WebApplicationContext.html) in conjunction with [`@ContextConfiguration`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/ContextConfiguration.html)
* [`@ContextHierarchy`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/ContextHierarchy.html) - define multiple [`ContextConfigurations`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/ContextConfiguration.html)
* [`@ActiveProfiles({"dev", "integration"})`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/ActiveProfiles.html) - select the active profiles for the test
  * Can also select an [`ActiveProfilesResolver`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/ActiveProfilesResolver.html) instead.
* [`@TestPropertySource("/test.properties")`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/TestPropertySource.html) - property files and inlined properties to be added (higher priority) to the set of [`PropertySources`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/core/env/PropertySource.html) in the [`Environment`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/core/env/Environment.html)
* [`@DirtiesContext(classMode = AFTER_CLASS)`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/annotation/DirtiesContext.html) - close remove the context from the testing framework's cache (rebuild again if needed)
  * [`BEFORE_CLASS`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/annotation/DirtiesContext.ClassMode.html#BEFORE_CLASS), `BEFORE_EACH_TESTMETHOD`, `AFTER_EACH_TEST_METHOD`, `AFTER_METHOD` (for individual/all tests in a test class), can also restrict to part of a hierarchy.
* [`@TestExecutionListeners`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/TestExecutionListeners.html) - register [`TestExecutionListeners`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/TestExecutionListener.html) with the [`TestContextManager`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/TestContextManager.html) (listen around test methods).
* [`@Commit`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/annotation/Commit.html) - commit a transaction after the test method has been completed (equivalent to [`@Rollback(false)`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/annotation/Rollback.html))
* [`@Rollback`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/annotation/Rollback.html) - rollback a transaction after the test method has completed (default behaviour).
* [`@BeforeTransaction`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/transaction/BeforeTransaction.html) and [`@AfterTransaction`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/transaction/AfterTransaction.html) - a `public void` method should be exected before/after a transaction  is started for [`@Transactional`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/transaction/annotation/Transactional.html) test methods.
* [`@Sql`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/jdbc/Sql.html) - execute tests scripts during tests.
* [`@SqlConfig`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/jdbc/SqlConfig.html) - configures how to parse and execute [`@Sql`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/jdbc/Sql.html) scripts.
* [`@SqlGroup`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/jdbc/SqlGroup.html) - aggregates several [`@Sql`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/jdbc/Sql.html) annotations (though Java 8 can do this implicitly).

Also standard annotations ([ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#integration-testing-annotations-standard)):

* [`@Autowired`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/beans/factory/annotation/Autowired.html), [`@Qualifier`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/beans/factory/annotation/Qualifier.html), [`@Resource`](http://docs.oracle.com/javase/8/docs/api/javax/annotation/Resource.html) (javax.annotation) if JSR-250 is present, [`@Inject`](http://docs.oracle.com/javaee/7/api/javax/inject/Inject.html) (javax.inject) if JSR-330 is present, [`@Named`](http://docs.oracle.com/javaee/7/api/javax/inject/Named.html) (javax.inject) if JSR-330 is present, [`@PersistenceContext`](http://docs.oracle.com/javaee/7/api/javax/persistence/PersistenceContext.html) (javax.persistence) if JPA is present, [`@PersistenceUnit`](http://docs.oracle.com/javaee/7/api/javax/persistence/PersistenceUnit.html) (javax.persistence) if JPA is present, [`@Required`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/beans/factory/annotation/Required.html), [`@Transactional`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/transaction/annotation/Transactional.html)

[Spring JUnit testing annotations](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#integration-testing-annotations-junit) used with the [`SpringJUnit4ClassRunner`](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#testcontext-junit4-runner), [Spring’s JUnit rules](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#testcontext-junit4-rules), or [Spring’s JUnit support classes](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#testcontext-support-classes-junit4)

* [`@IfProfileValue(name="java.vendor", value="OracleCorporation")`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/annotation/IfProfileValue.html)
  * `values={"unit-tests", "integration-tests"}` - OR semantics
* [`@ProfileValueSourceConfiguration(CustomProfileValueSource.class`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/annotation/ProfileValueSourceConfiguration.html) - which [`ProfileValueSource`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/annotation/ProfileValueSource.html) to use - defaults to [`SystemProfileValueSource`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/annotation/SystemProfileValueSource.html)
* [`@Timed(millis-1000)`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/annotation/Timed.html) - fails if the test takes longer (but waits until it finishes, unlike JUnit's [`@Test(timeout=...)`](http://junit.org/javadoc/latest/org/junit/Test.html#timeout())
* [`@Repeat(10)`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/annotation/Repeat.html) - repeat the test, including setup and teardown.

Meta-Annotation Support for Testing ([ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#integration-testing-annotations-meta))

* Many annotations can be used as [meta-annotations](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#beans-meta-annotations) in order to create custom composed annotations (to reduce duplication).
 
  ```java
  @Target(ElementType.TYPE)
  @Retention(RetentionPolicy.RUNTIME)
  @ContextConfiguration({"/app-config.xml", "/test-data-access-config.xml"})
  @ActiveProfiles("dev")
  @Transactional
  public @interface TransactionalDevTest { }
  ```
## [TestContext Framework](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#testcontext-framework)

## [Spring MVC Test Framework](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#spring-mvc-test-framework)
