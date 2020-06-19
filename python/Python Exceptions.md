# Python Exceptions

* <https://docs.python.org/2/tutorial/errors.html>
* Tutorial: [Errors and Exceptions](https://docs.python.org/3/tutorial/errors.html)
* Standard exceptions: <https://docs.python.org/3/library/exceptions.html>

```python
raise ValueError('my error message')
```

```python
try:
    # some code
except (RuntimeError, TypeError, NameError) as ex:
    # handler
```

Subclass an exception ([SO](https://stackoverflow.com/a/1319675/125246)):

```python
class MyException(Exception):
    pass
```