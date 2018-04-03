# Python Strings

```python
"a"
'a'
'''multi
line'''
```
Remove common leading whitespace with [`textwrap.dedent`](https://docs.python.org/3/library/textwrap.html):

```python
# end first line with \ to avoid the empty line!
from textwrap import dedent
dedent("""\
   multiline
   remove common leading whitespace
""")
```

Concatenate strings

```python
str = 'hello ' + 'there'
str2 = 'pattern %s substitution %s' % (val1, val2)
str2 = 'pattern %s substitution %s' % tuple([val1, val2])
str3 = '.'.join(list)
```

Split strings ([SO](https://stackoverflow.com/a/12739929/125246)):

```python
a = [ 'abc=lalalla', 'appa=kdkdkdkd', 'kkakaka=oeoeoeo']
d = dict(s.split('=') for s in a)
print d

Output:
{'kkakaka': 'oeoeoeo', 'abc': 'lalalla', 'appa': 'kdkdkdkd'}
```

Length (in bytes for Python 2) ([SO](https://stackoverflow.com/a/37262373/125246)):

```python
print(len('abc'))       # 3
```

## String Formatting

Python 2:

```python
print "my str {:} {:}".format(val1, val2)
```

## [Regular Expressions](https://docs.python.org/3/library/re.html)

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
