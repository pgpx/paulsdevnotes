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
* `@ComponentScan`

