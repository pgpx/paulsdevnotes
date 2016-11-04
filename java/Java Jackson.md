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