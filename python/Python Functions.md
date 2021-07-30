# Python Functions

```python
def my_fund_name(arg1, arg2, arg3):
    return arg1 + arg2 + arg3
```

Variable numbers of arguments with `*` ([SO](https://stackoverflow.com/a/919684/125246)) and [ref](https://docs.python.org/2/tutorial/controlflow.html#arbitrary-argument-lists):

```python
def manyArgs(*arg):
  print "I was called with", len(arg), "arguments:", arg
```

`*` can be used by itself to indicate that keyword only arguments follow, without allowing for unlimited positional arguments ([SO](https://stackoverflow.com/a/26365795/125246)).

```python
def foo(arg, kwarg=None, *, kwarg2=None, **kwargs):
    return arg, kwarg, kwarg2, kwargs

# Here, kwarg2 again must be an explicitly named, keyword argument:
foo(1,2,kwarg2='kwarg2', foo='foo', bar='bar')
```

## Lambda functions

* ([ref](https://docs.python.org/2.7/tutorial/controlflow.html#lambda-expressions))
* <http://www.secnetix.de/olli/Python/lambda_functions.hawk>

```python
def f(x): return x**2
g = lambda x: x**2
```

## Partial functions

* <https://docs.python.org/2/library/functools.html#partial-objects>

```python
from functools import partial
my_partial = partial(my_func, arg1, arg2)
res = my_partial(arg3, arg4)
```

## Unpack arguments from a list or dict:

Unpack a list or tuple into positional arguments with `*`, and a dict into named arguments with `**` ([SO](https://stackoverflow.com/a/7527889/125246)):

```python
x = (1, 2, 3)
add(*x)

x = { 'a': 3, 'b': 1, 'c': 2 }
add(**x) 
```