# Python

* <https://www.python.org/>
  * [Docs Main Page](https://www.python.org/doc/), [v3 docs](https://docs.python.org/3/), [v3 modules](https://docs.python.org/3/py-modindex.html), [v3 library](https://docs.python.org/3/library/index.html)
* [PEP 8](https://www.python.org/dev/peps/pep-0008/) -- Style Guide for Python Code
* [PEP 20](https://www.python.org/dev/peps/pep-0020/) -- The Zen of Python
* <https://awesome-python.com/> - list of frameworks, libraries, software and resources
* [Google Python Style Guide](http://google.github.io/styleguide/pyguide.html)
* [PEP 8 Style Guide](https://www.python.org/dev/peps/pep-0008/)

Books:

* [Programming in Python 3: A Complete Introduction to the Python Language, Second Edition](https://www.safaribooksonline.com/library/view/programming-in-python/9780321699909/)
* [Python Tips](https://book.pythontips.com/en/latest/index.html)

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

## WSGI Web Server
* [wsgiref](https://docs.python.org/2/library/wsgiref.html)
