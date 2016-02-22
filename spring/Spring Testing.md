# [Spring Testing](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#testing)

## [Unit testing](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#unit-testing)

## [Integration testing](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#integration-testing)

...

### [Annotations](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#integration-testing-annotations-spring)

* [`@ContextConfiguration`]() - how to load an [`ApplicationContext`]() for integration tests.
  * [`classes = TestConfig.class`]()
  * [`initializers = CustomContextInitializer.class`]() - for [`ApplicationContextInitializer`]() classes 
  * [`locations = "classpath:/myconfig.xml`]()
  * [`loader = CustomContextLoader.class`]()
* [`@WebAppConfiguration("file:/src/main/webapp")`]() - to load a [`WebApplicationContext`]() in conjunction with [`@ContextConfiguration`]()
* [`@ContextHierarchy`]() - define multiple [`ContextConfigurations`]()
* [`@ActiveProfiles({"dev", "integration"}) - select the active profiles for the test
* [`@TestPropertySource("/test.properties")`]() - property files and inlined properties to be added to the set of [`PropertySources`]() in the [`Environment`]
* [`@DirtiesContext(classMode = AFTER_CLASS`]() - close remove the context from the testing framework's cache (rebuild again if needed)
  * `BEFORE_CLASS`, `BEFORE_EACH_TESTMETHOD`, `AFTER_EACH_TEST_METHOD`, `AFTER_METHOD` (for individual/all tests in a test class), can also restrict to part of a hierarchy.
* [`@TestExecutionListeners`]() - register [`TestExecutionListeners`]() with the [`TestContextManager`]()
* [`@Commit`]() - commit a transaction after the test method has been completed (equivalent to `@Rollback(false)`)
* [`@Rollback`]() - rollback a transaction after the test method has completed (default behaviour).
* [`@BeforeTransaction`]() and [`@AfterTransaction`]() - a `public void` method should be exected before/after a transaction  is started for [`@Transactional`]() test methods.
* [`@Sql`]() - execute tests scripts during tests.
* [`@SqlConfig`]() - configures how to parse and execute [`@Sql`]() scripts.
* [`@SqlGroup`]() - aggregates several [`@Sql`] annotations (though Java 8 can do this implicitly).

Also standard annotations ([ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#integration-testing-annotations-standard)):

* [`@Autowired`](), [`@Qualifier`](), [`@Resource`]() (javax.annotation) if JSR-250 is present, [`@Inject`]() (javax.inject) if JSR-330 is present, [`@Named`]() (javax.inject) if JSR-330 is present, [`@PersistenceContext`]() (javax.persistence) if JPA is present, [`@PersistenceUnit`]() (javax.persistence) if JPA is present, [`@Required`](), [`@Transactional`]()

[Spring JUnit testing annotations](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#integration-testing-annotations-junit) used with the [`SpringJUnit4ClassRunner`](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#testcontext-junit4-runner), [Spring’s JUnit rules](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#testcontext-junit4-rules), or [Spring’s JUnit support classes](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#testcontext-support-classes-junit4)

* [`@IfProfileValue(name="java.vendor", value="OracleCorporation")
  * `values={"unit-tests", "integration-tests"}` - OR semantics
* [`@ProfileValueSourceCOnfiguration(CustomProfileValueSource.class`]() - which [`ProfileValueSource`]() to use - defaults to [`SystemProfileValueSource`]()
* [`@Timed(millis-1000)`]() - fails if the test takes longer (but waits until it finishes, unlike JUnit's [`@Test(timeout=...)`]()
* [`@Repeat(10)`]() - repeat the test, including setup and teardown.

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
