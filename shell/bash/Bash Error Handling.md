# Bash Error Handling

[Do your own error handling](http://mywiki.wooledge.org/BashFAQ/105) ([SO](https://stackoverflow.com/a/36335414/125246))

```shell script
cd invalid_directory || { echo "cd to invalid_directory failed" >&2; exit 1; }
```

Or with `trap` ([SO](https://stackoverflow.com/a/36335414/125246))

```shell script
set -e
clean_up () {
    ARG=$?
    echo "> clean_up"
    exit $ARG
} 
trap clean_up EXIT
cd invalid_directory
echo "Shouldn't reach this"
```

## Trap errors

```bash
trap "exit" INT TERM
trap "rm '${tempdir}'/users*" EXIT
```