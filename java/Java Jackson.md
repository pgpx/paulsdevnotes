# Java Jackson - JSON Library

* [Wiki](http://wiki.fasterxml.com/JacksonHome), [GitHub](https://github.com/FasterXML/jackson)
    * [JacksonInFiveMinutes](http://wiki.fasterxml.com/JacksonInFiveMinutes)
    
## Annotations

Can use (most) normal JAXB annotations.

Don't output empty collections:

```java
@JsonInclude(NON_EMPTY)
protected List<String> myList = new ArrayList<>();
```

Ignore unknown properties ([SO](http://stackoverflow.com/a/5455563/125246))

```java
@JsonIgnoreProperties(ignoreUnknown = true)
public class Foo {
```