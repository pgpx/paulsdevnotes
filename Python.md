# Python

* <https://www.python.org/>
  * [Docs](https://www.python.org/doc/)


Books:

* [Programming in Python 3: A Complete Introduction to the Python Language, Second Edition](https://www.safaribooksonline.com/library/view/programming-in-python/9780321699909/)

## Interpreter

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

## WSGI Web Server
* [wsgiref](https://docs.python.org/2/library/wsgiref.html)
