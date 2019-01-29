# grep

## Examples

Negative match `-v` and extended regexp `-E <regexp>` (ignore comments and whitespace-only lines):
```bash
grep -vE '^\#|^\s*$'
```

Perl-style regex (not supported by OS/X) ([SO](http://stackoverflow.com/a/33177949/125246)):

```bash
grep -P "\d{9}"
```

Do something if a match is found ([SO](https://stackoverflow.com/a/13025001/125246))

```bash
if find "/app/$var1" -maxdepth 1 -type l -o -type d | grep -q "$var2"; then
    $realcmd "$@"
    exit $?
else
    echo "no match, the version you are looking for does not exist"
    # Should there be an exit here?
fi
```