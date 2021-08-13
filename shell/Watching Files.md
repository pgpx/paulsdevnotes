# Watching Files

## fswatch

> A cross-platform file change monitor with multiple backends: Apple OS X File System Events API, *BSD kqueue, Solaris/Illumos File Events Notification, Linux inotify and a stat()-based backend.

* <https://emcrisostomo.github.io/fswatch/>
* [SO](https://stackoverflow.com/a/13807906/125246)

```bash
fswatch --one-per-batch --directories --filter-from=fswatch-filter.txt -v  --recursive "$(pwd)" |  xargs -I{}  -n 1 
```

Where `fswatch-filter.txt` contains ([ref](http://emcrisostomo.github.io/fswatch/doc/1.16.0/fswatch.html/Invoking-fswatch.html#Filtering-by-Path)):

```
- exclude-glob/*
+ include-glob/*
-e exclude-extended-regex.*
-ei exclude-case-insensitive-regex.*

# e.g. include only .cpp files:
- .*
+i \.cpp$
```
