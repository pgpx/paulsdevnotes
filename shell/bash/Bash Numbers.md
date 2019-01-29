# Bash Numbers

Variables are treated as integer or string depending on context ([SO](https://unix.stackexchange.com/a/232386/32390))

```bash
$ a=2
$ echo "$a + 1"
2 + 1
$ echo "$(($a + 1))"
```

... but using `$(())` or `(())` is unsafe if you don't know what the strings are.  *What should we use instead?*