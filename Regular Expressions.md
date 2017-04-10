# Regular Expressions

## Replacement expressions

### Convert to lower/uppercase ([SO](http://stackoverflow.com/a/21313098/125246))

`\L` converts following characters to lowercase, `\U` to uppercase, and `\E` switches back to the original case.
```regexp
\L\1\E

\.get(\w)
.\L$1
```

e.g. to remove the `get` prefix and next char to lowercase: match `\.get(\w)` then replace with `.\L$1`

Or in `sed` ([SO](http://stackoverflow.com/a/1159389/125246), [SO](http://stackoverflow.com/a/870498/125246)):

```bash
sed -r 's/(^.*)/\L\1/'
```