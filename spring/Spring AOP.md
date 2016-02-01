# Spring AOP

## Scoped proxy

```java
@Bean
// true (default)=CGLib-based class proxy, false=JDK interface-based proxy
@Scope(value = "session", proxyMode = ScopedProxyMode.INTERFACES
public SomeBean someBean() {
  return new SomeBean();
}
```
