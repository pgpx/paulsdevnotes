# Python

* <https://www.python.org/>
  * [Docs Main Page](https://www.python.org/doc/), [v3 docs](https://docs.python.org/3/), [v3 modules](https://docs.python.org/3/py-modindex.html), [v3 library](https://docs.python.org/3/library/index.html)


Books:

* [Programming in Python 3: A Complete Introduction to the Python Language, Second Edition](https://www.safaribooksonline.com/library/view/programming-in-python/9780321699909/)


## Library

* [built-in functions](https://docs.python.org/2/library/functions.html)
* [json](https://docs.python.org/2.7/library/json.html#) - JSON encoder/decoder
* [pprint](https://docs.python.org/2/library/pprint.html) - data pretty-printer

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

### Functions

Variable numbers of arguments with `*` ([SO](https://stackoverflow.com/a/919684/125246)) and [ref](https://docs.python.org/2/tutorial/controlflow.html#arbitrary-argument-lists):

```python
def manyArgs(*arg):
  print "I was called with", len(arg), "arguments:", arg
```

* Lambda expressions ([ref](https://docs.python.org/2.7/tutorial/controlflow.html#lambda-expressions))

### Conditionals

```python
if res is None:
    # 
elif res > 3:
    #
else:
    #
```

### Strings

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

Regex

```python
# Substitute, returning the result
import re
res = re.sub(r'^.*z', 'repl')
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

### Tuples

```python
t = (val1, val2)
t = tuple([val1, val2])
```

### Lists

```python
l = [val1, val2]
for key in l:
    print key
    
res = map(lambda i: i + 1, l)
```

in ([SO](https://stackoverflow.com/a/12934223/125246))

```python
if myItem in list:
```

### Dictionaries/Maps

```python
# Test for key
if key in obj:
# Get value (error if not found)
obj[key]
# Get value or default if not found
obj.get(key, default)
```

### Modules

Import modules ([ref](https://docs.python.org/3/reference/simple_stmts.html#import)):

```python
import foo                 # foo imported and bound locally
import foo.bar.baz         # foo.bar.baz imported, foo bound locally
import foo.bar.baz as fbb  # foo.bar.baz imported and bound as fbb
from foo.bar import baz    # foo.bar.baz imported and bound as baz
from foo import attr       # foo imported and foo.attr bound as attr
from foo import *          # foo imported and all pulbic names in foo bound to local namespace
```

### Functions

```python
def my_fund_name(arg1, arg2, arg3):
    return arg1 + arg2 + arg3
```

### Exceptions

```python
raise ValueError('my error message')
```

## Scripting

```bash
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

## JSON

```python
import json
parsed = json.loads(payload)
```

Convert sets to sorted lists (modified from [SO](https://stackoverflow.com/a/8230505/125246)), and using sorted keys ([SO](https://stackoverflow.com/a/36336386/125246)):
```python
class JSONSetEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, collections.Set):
            res = list(obj)
            res.sort()
            return res
        else:
            return json.JSONEncoder.default(self, obj)

print json.dumps(my_obj, indent=4, sort_keys=True, cls=JSONSetEncoder)
```

## Partial functions

* <https://docs.python.org/2/library/functools.html#partial-objects>

```python
from functools import partial
my_partial = partial(my_func, arg1, arg2)
res = my_partial(arg3, arg4)
```

## Dates

* [datetime](https://docs.python.org/2/library/datetime.html)
* [time](https://docs.python.org/2/library/time.html)

Convert to epoch timestamp ([SO](https://stackoverflow.com/a/7241238/125246)):

```python
import time
date_time = '29.08.2011 11:05:02'
pattern = '%d.%m.%Y %H:%M:%S'
epoch = int(time.mktime(time.strptime(date_time, pattern)))
```

Use [dateutil](https://dateutil.readthedocs.io/en/stable/index.html) to parse numeric timezone offsets (not supported by default) ([SO](https://stackoverflow.com/questions/1101508/how-to-parse-dates-with-0400-timezone-string-in-python)):

```python
from dateutil.parser import parse
d = parse('2009/05/13 19:19:30 -0400')
```

## System calls

Use the [`subprocess`](https://docs.python.org/3/library/subprocess.html#module-subprocess) module.

## WSGI Web Server
* [wsgiref](https://docs.python.org/2/library/wsgiref.html)

## I/O

* Read from stdin ([SO](https://stackoverflow.com/questions/1450393/how-do-you-read-from-stdin-in-python))

* Get current script's directory ([SO](https://stackoverflow.com/q/4934806/125246))

```python
import os
print os.getcwd()
```

## Multithreading

* <https://docs.python.org/2/library/multiprocessing.html#module-multiprocessing.pool>
* [SO](https://stackoverflow.com/a/28463266/125246)
* <http://chriskiehl.com/article/parallelism-in-one-line/>
* <http://www.laurentluce.com/posts/python-threads-synchronization-locks-rlocks-semaphores-conditions-events-and-queues/>

```python
from multiprocessing import Pool
if __name__ == '__main__':
    pool = Pool(5)
    # Call function in parallel, but keep output order unchanged
    for values in pool.imap(my_func, filedesc, 100):
        process_values(values)
```