# IntelliJ

## CLI

[Reference](https://www.jetbrains.com/help/idea/working-with-the-ide-features-from-command-line.html#arguments)

If IntelliJ doesn't start properly try:

```bash
/Applications/IntelliJ\ IDEA.app/Contents/MacOS/idea dontReopenProjects
```

## Sync history

To look at settings sync history ([ref](https://youtrack.jetbrains.com/issue/IJPL-13115/Feature-Restore-settings-to-previous-version-when-Settings-Sync-is-enabled#focus=Comments-27-11084096.0-0) and [ref](https://youtrack.jetbrains.com/issue/IJPL-13115/Feature-Restore-settings-to-previous-version-when-Settings-Sync-is-enabled#focus=Change-27-9466823.0-0.pinned)):

* Search everywhere (double-`Shift`) for `Backup And Sync History`
* Find the commit to revert
* Go to the [configuration directory](Backup And Sync History)`/settingsSync`
* `git checkout master`
* `git revert <mycommit>`
* `git checkout ide`

## Formatting

* Turn off auto-formatting ([SO](http://stackoverflow.com/a/19492318/125246)):
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

* Use [EditorConfig](https://editorconfig.org) to define an `.editorconfig` file with properties like tabs-as-spaces, which many editors will then detect.

## Turn off import wildcards

[SO](https://stackoverflow.com/a/3348855/125246) Go to Preferences (⌘ + , on macOS / Ctrl + Alt + S on Windows) > Editor > Code Style > Java > Imports tab set Class count to use import with '*' and Names count to use static import with '*' to a higher value. Any value over 99 seems to work fine.

Do the same for Groovy.

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

## CLI

[Start from the CLI](https://intellij-support.jetbrains.com/hc/en-us/articles/360011901879-How-to-start-IDE-from-the-command-line)

## Issues

* `findbugs not compatible marked broken` - <https://youtrack.jetbrains.com/issue/IDEA-232675>