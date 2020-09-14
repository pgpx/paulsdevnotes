# Bash Numbers

Variables are treated as integer or string depending on context ([SO](https://unix.stackexchange.com/a/232386/32390))

```bash
$ a=2
$ echo "$a + 1"
2 + 1
$ echo "$(($a + 1))"
```

... but using `$(())` or `(())` is unsafe if you don't know what the strings are.  *What should we use instead?*

Comparing numbers ([SO](https://stackoverflow.com/a/18668580/125246)):

```bash
# Bash
if (( a > b )); then
    ...
fi

# For POSIX shells that don't support (()), you can use -lt and -gt.
if [ "$a" -gt "$b" ]; then
    ...
fi
```