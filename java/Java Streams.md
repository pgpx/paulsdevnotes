# Java Streams

# Reduce and collect

[SO](https://stackoverflow.com/a/38728166/125246)
* `collect()` can only work with mutable result objects.
* `reduce()` is designed to work with immutable result objects.

Both have to cater for parallel invocation.  If you want serial processing, convert to a list first ([SO](https://stackoverflow.com/a/24316429/125246))

## Filters

* `Objects::nonNull`

## Files.lines

* Still need to close ([SO](https://stackoverflow.com/a/34073306/125246)) - because "whoever acquires the resource should release the resource" and "Files don't auto-close when you read to EOF; we expect files to be closed explicitly by whoever opened them."

    ```java
    try (Stream<String> s = Files.lines(...)) {
        s.forEach(...);
    }
    ```