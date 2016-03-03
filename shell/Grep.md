# grep

## Examples

Negative match `-v` and extended regexp `-E <regexp>` (ignore comments and whitespace-only lines):
```bash
grep -vE '^\#|^\s*$'
```
