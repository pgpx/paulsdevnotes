# Java-based configuration for Spring

* <http://docs.spring.io/spring/docs/4.3.0.BUILD-SNAPSHOT/spring-framework-reference/htmlsingle/#beans-java>

## Basic annotations

```java
@Configuration
@ComponentScan(basePackages = "com.acme")
public class AppConfig {
  @Bean
  public MyService myService() {
    return new MyServiceImpl();
  }
}
```

* `@Configuration` - class is a source of bean definitions.
* `@Bean` - method instantiates, configures, and initialises a new object.
  * If not in a `@Configuration` class (e.g. in a `@Component`)
    then will be instantiated in a 'lite' mode without inter-bean dependencies.
* `@ComponentScan` - look for classes meta-annotated with `@Component` in the specified package (and sub-packages).
  This includes further `@Configuration` classes.
* `@ImportResource("classpath:/com/acme/properties-config.xml")` - import XML-based config.
* 
Use `AnnotatedConfigWebApplicationContext` for Spring MVC to use Java config - see
[example `web.xml`](http://docs.spring.io/spring/docs/4.3.0.BUILD-SNAPSHOT/spring-framework-reference/htmlsingle/#beans-java-instantiating-container-web)

To use in XML-based config, just define the `@Configuration` class as a `<bean>`.  Alternatively, just use component scanning.


## @Bean

Annotate a method to declare a bean.

Parameters:

* `name = "myFoo"` - customise bean name.
  * `name = { "dataSource", "subsystemA-dataSource", "subsystemB-dataSource" }` - multiple names/aliasing.
* `@Description("Provides a basic example of a bean")` - textual description - documentation/JMX.
* `initMethod = "init"` - initialisation callback method.
* `destroyMethod = "cleanup"` - destruction callback method.
  * Automatically calls public `close` or `shutdown` methods on the class unless `@Bean(destroyMethod="")` is used.
  * Set it to `""` for JNDI resources (such as `DataSource`) where the lifecycle is managed outside of the application.

Notes

* Bean name defaults to method name.
* Return class is bean class.
* Dependencies given as method parameters (resolution similar to constructor injection).
* Beans support regular callbacks such as:
  * JSR-250 annotations: `@PostConstruct` and `@PreDestroy`.
  * `InitializingBean`, `DisposableBean`, or `Lifecycle`.
  * `*Aware` interfaces such as `BeanFactoryAware`, `BeanNameAware`, `MessageSourceAware`, `ApplicationContextAware`.

Scope:

* `@Scope("prototype")` - change the scope of the bean, defaults to `singleton`.
* `@Scope(value = "session", proxyMode = ScopedProxyMode.TARGET_CLASS)` - Scoped proxies.  Default is `NO`, but can specify `TARGET_CLASS` or `INTERFACES`.

Import:

* `@Import(ConfigA.class)` - imports other classes, so only parent needs to be supplied to the context directly.

Dependency injection:

* One bean can inject another by calling its `@Bean` method (as long as both are in `Configuration` classes).
  * For singletons, CGLIB intercepts these method calls so only one instance is actually created.
    * `@Configuration` classes must not be final and must have a no-arg constructor.

```java
@Bean
  public Foo foo() {
  return new Foo(bar());
}

@Bean
public Bar bar() { return new Bar(); }
```

* Method parameters.
* `@Autowired` - declare autowired members that can then be used in `@Bean` methods.
  * Better to use parameter-based injection, becasue `@Configuration` classes are processed quite early,
  * `BeanPostProcessor` and `BeanFactoryPostProcessor` created via @Bean should usually be declared as static `@Bean` methods, not triggering the instantiation of their containing configuration class. Otherwise, `@Autowired` and `@Value` won’t work on the configuration class itself since it is being created as a bean instance too early.
  * Can use `@Autowired` to include a `@Configuration` class, and then access its `@Bean` methods directly.
    * Use interfaces and implementations of `@Configuration` classes, so that the implementation can be switched.

```java
@Configuration
public class ServiceConfig {
  @Autowired
  private RepositoryConfig repositoryConfig;

  @Bean
  public TransferService transferService() {
    // navigate 'through' the config class to the @Bean method!
    return new TransferServiceImpl(repositoryConfig.accountRepository());
  }
}
```
 
* `@Value("${jdbc.username}")`.
* Lookup method injection, used when a singleton-scoped bean has a dependency on a prototype-scoped bean (and wants
  a new instance for each call).

```java
public abstract class CommandManager {
  public Object process(Object commandState) {
    // grab a new instance of the appropriate Command interface
    Command command = createCommand();
    // set the state on the (hopefully brand new) Command instance
    command.setState(commandState);
    return command.execute();
  }

  // okay... but where is the implementation of this method?
  protected abstract Command createCommand();
}

@Bean
@Scope("prototype")
public AsyncCommand asyncCommand() {
  AsyncCommand command = new AsyncCommand(); // inject dependencies here as required return command;
}

@Bean
public CommandManager commandManager() {
  // return new anonymous implementation of CommandManager with command() overridden
  // to return a new prototype Command object
  return new CommandManager() {
    protected Command createCommand() { return asyncCommand(); }
  }
}
```

## Profiles and conditionals

* `@Profile` - activate beans only where a specific profile has been enabled.
* `@Conditional` - more flexible version of that.