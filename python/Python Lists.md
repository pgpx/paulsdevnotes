# Python Lists

* Ref: [Lists (introduction)](https://docs.python.org/3/tutorial/introduction.html#lists)
* Ref: [More on Lists](https://docs.python.org/3/tutorial/datastructures.html#more-on-lists)

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

Is a list empty? ([SO](https://stackoverflow.com/a/53522/125246))
```python

if my_list:
    print("List is not empty")
elif not my_list:
    print("List is empty")
```

## Iteration

Capture index and element ([SO](https://stackoverflow.com/a/14532900/125246))

```python
for index, el in enumerate(list):
```

[Chain](https://docs.python.org/2/library/itertools.html#itertools.chain) multiple lists together:

`s``python
from itertools import chain
for i in chain(list_1, list_2)
```

## [List comprehensions](https://docs.python.org/3/tutorial/datastructures.html#list-comprehensions)

```python
squares = [x**2 for x in range(10)]
# equivalent to:
squares = list(map(lambda x: x**2, range(10)))
```

> A list comprehension consists of brackets containing an expression followed by a for clause, then zero or more for or if clauses. The result will be a new list resulting from evaluating the expression in the context of the for and if clauses which follow it. For example, this listcomp combines the elements of two lists if they are not equal:

```python
[(x, y) for x in [1,2,3] for y in [3,1,4] if x != y]
```