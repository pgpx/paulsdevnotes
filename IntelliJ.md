# IntelliJ

## Formatting

Turn off auto-formatting ([SO](http://stackoverflow.com/a/19492318/125246)):

* _Preferences -> Editor -> Code Style -> General -> Formatter Control -> Enable formatter markers in comments_

Then:

```java
// @formatter:off
...
// @formatter:on 
```

and

```xml
<!-- @formatter:off -->
<!-- @formatter:on -->
```

## Logs

OS/X:

```sh
less ~/Library/Logs/IntelliJIdea2016.1/idea.log
```
