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

Remove leading/trailing/both whitespace ([SO](https://stackoverflow.com/a/275025/125246)):

```python
my_string.lstrip()
my_string.rstrip()
my_string.strip()
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

## Printing

```python
x = a + b
x = '%s, %s!' % (imperative, expletive)
x = '{}, {}'.format(first, second)
x = 'name: %s; score: %d' % (name, n)
x = 'name: {}; score: {}'.format(name, n)
x = f'name: {name}; score: {n}'  # Python 3.6+
```