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
