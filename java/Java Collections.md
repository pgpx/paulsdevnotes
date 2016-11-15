# Java Collections

## Maps


Create an index (map property to value):

Using [Guava](https://github.com/google/guava): ([SO](http://stackoverflow.com/q/20363719/125246))

```java
Maps.uniqueIndex(choices, c -> c.getName());
```

Or streams: ([SO](http://stackoverflow.com/a/20363874/125246))

```java
Map<String, Choice> result =
    choices.stream().collect(Collectors.toMap(Choice::getName,
                                              Function.identity()));
```