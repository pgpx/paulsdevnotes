# Java

* Java 8 [Docs](http://docs.oracle.com/javase/8/docs/), [API](http://docs.oracle.com/javase/8/docs/api/index.html)

## JVM analysis tools

[`jmap`](https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jmap.html) - heap/thread dump ([ref](https://blog.codecentric.de/en/2011/08/create-and-understand-java-heapdumps-act-4/))

```sh
# Dump live objects (only)
jmap -dump:live,format=b,file=<filename> <PID

# Quick histogram of heap contents
jmap -histo:live <pid>
```

[`jstack`](https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jstack.html) - capture thread dumps ([ref](https://helpx.adobe.com/experience-manager/kb/TakeThreadDump.html))

```sh
jstack <pid>
```

[`jstat`](https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jstat.html) - capture stats about the heap ([SO](http://stackoverflow.com/a/12802597/125246))

```sh
# Garbage-collected heap stats
jstat -gc <pid>
# Memory pool generation and space
jstat -gccapacity <pid>
# Utilisation of each generation
jstat -gcutil <pid>
```
