# Python

* <https://www.python.org/>
  * [Docs Main Page](https://www.python.org/doc/), [v3 docs](https://docs.python.org/3/), [v3 modules](https://docs.python.org/3/py-modindex.html), [v3 library](https://docs.python.org/3/library/index.html)


Books:

* [Programming in Python 3: A Complete Introduction to the Python Language, Second Edition](https://www.safaribooksonline.com/library/view/programming-in-python/9780321699909/)

## Interpreter

Use the interpreter to list methods ([ref](https://docs.python.org/3/faq/general.html#is-python-a-good-language-for-beginning-programmers))
```python
python3
L=[]
dir(L)    // Lists all members of arary
[d for d in dir(L) if '__' not in d]  // Lists those not including __ in their name
help(L.append)  // Documentation for append method
```

## Basics

Strings

```python
"a"
'a'
'''multi
line'''
```
Remove commont leading whitespace with [`textwrap.dedent`](https://docs.python.org/3/library/textwrap.html):

```python
# end first line with \ to avoid the empty line!
from textwrap import dedent
dedent("""\
   multiline
   remove common leading whitespace
""")
```

Import modules ([ref](https://docs.python.org/3/reference/simple_stmts.html#import)):

```python
import foo                 # foo imported and bound locally
import foo.bar.baz         # foo.bar.baz imported, foo bound locally
import foo.bar.baz as fbb  # foo.bar.baz imported and bound as fbb
from foo.bar import baz    # foo.bar.baz imported and bound as baz
from foo import attr       # foo imported and foo.attr bound as attr
from foo import *          # foo imported and all in foo bound to local namespace
```

## Scripting

```python
#!/usr/bin/env python3
```

`import sys`

* `sys.argv` - command-line arguments (`sys.argv[0]` is command name, `sys.argv[1]` is first argument, etc.)

## I/O

Print to STDOUT (arguments separated by spaces) ([ref](https://www.safaribooksonline.com/library/view/programming-in-python/9780321699909/ch01.html)):

```python
print("Hello", "World!")
```


Write to a file:

```python
log = open("name.log", "a")
log.write("Hello")
log.close()
```

## System calls

Use the [`subprocess`](https://docs.python.org/3/library/subprocess.html#module-subprocess) module.

## WSGI Web Server
* [wsgiref](https://docs.python.org/2/library/wsgiref.html)
