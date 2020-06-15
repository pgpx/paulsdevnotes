# Python Regular Expressions

* <https://docs.python.org/3/library/re.html>

`r`-prefixed strings are 'raw' [literals](https://docs.python.org/3/reference/lexical_analysis.html#literals), and most characters (except the quoting character) do not need to be escaped with `\` (cannot end in a backslash).  

```python
import re
line_re = re.compile(r""".*(abc).*""")

# Or multi-line
line_re = re.compile(r"""
    ^(`w+)      # Comment
    .*$
    """, re.VERBOSE)
```

Matching:
```python
my_match = line_re.match(string)
if my_match:
    gr = my_match.group(1)
```

Substitute (returning the result):
```python
res = re.sub(r'^(.*)z', r'\1y', string_to_apply_replacement_to)
```

Escaping strings to be dynamically added to a regex using `re.escape(str)` ([SO](https://stackoverflow.com/a/280441/125246)):

```python
regex = re.compile(rf"""
        (?P<before>^|[\s:])
        {re.escape(orig)}
        """, re.VERBOSE)
```