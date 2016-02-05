# Spring Transactions

## [Java config](http://docs.spring.io/spring/docs/4.2.x/spring-framework-reference/htmlsingle/#transaction-declarative-annotations)

```java
@Configuration
@EnableTransactionManagement
public class Config {

    // Transaction manager called txManager by default
    // See EnableTransactionManagement for other options.
    @Bean
    public PlatformTransactionManager txManager() {
        return new DataSourceTransactionManager(dataSource());
    }
}

```
