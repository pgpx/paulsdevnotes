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

Ignore escaped quotes within quotes:

([SO](https://stackoverflow.com/a/5696141/125246))

Good:
`"([^"\\]|\\.)*"`
Version 1: Works correctly but is not terribly efficient.

Better:
`"([^"\\]++|\\.)*" or "((?>[^"\\]+)|\\.)*"`
Version 2: More efficient if you have possessive quantifiers or atomic groups (See: sin's correct answer which uses the atomic group method).

Best:
`"[^"\\]*(?:\\.[^"\\]*)*"`
Version 3: More efficient still. Implements Friedl's: "unrolling-the-loop" technique. Does not require possessive or atomic groups (i.e. this can be used in Javascript and other less-featured regex engines.)
```