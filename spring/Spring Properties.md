# Spring Properties

## Converting a comma-separated list to a List<String>

EIther split the string using a Spring Expression ([SO](https://stackoverflow.com/a/12580260/125246)):

```java
@Value("#{'${my.list.of.strings}'.split(',')}") 
private List<String> myList;
```

or install a `ConversionService` that will do this for you:

```java
@Bean public ConversionService conversionService() {
    return new DefaultConversionService();
}

@Value("${my.list.of.ints}")
private List<Integer> myList
```