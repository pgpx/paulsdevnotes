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

## Runtime nonull checks

`Preferences -> Build -> Compiler -> Add runtime assertions for not-null-annotated methods and parameters`

Will throw `IllegalStateExceptions`.

## Useful plugins

* [StringManipulation](https://plugins.jetbrains.com/plugin/2162-string-manipulation) - `Alt/Option+M` - lets you change case, escape/unescape XML/JSON/Java strings, etc.