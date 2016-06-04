# Python

* <https://www.python.org/>
  * [Docs Main Page](https://www.python.org/doc/), [v3 docs](https://docs.python.org/3/), [v3 modules](https://docs.python.org/3/py-modindex.html)


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
