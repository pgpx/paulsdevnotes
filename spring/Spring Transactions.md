# Spring Transactions

## Java config

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
