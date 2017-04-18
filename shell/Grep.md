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