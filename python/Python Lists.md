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

Shallow-[copy](https://www.programiz.com/python-programming/methods/list/copy) a list (otherwise you are just copying a reference):

```python
my_copy = my_list.copy()
```

## Iteration

Capture index and element ([SO](https://stackoverflow.com/a/14532900/125246))

```python
for index, el in enumerate(list):
```

[Chain](https://docs.python.org/2/library/itertools.html#itertools.chain) multiple lists together:

```python
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

## Slices

[SO](https://stackoverflow.com/a/509295/125246)

```python
a[start:stop]  # items start through stop-1
a[start:]      # items start through the rest of the array
a[:stop]       # items from the beginning through stop-1
a[:]           # a copy of the whole array
There is also the step value, which can be used with any of the above:

a[start:stop:step] # start through not past stop, by step
#The key point to remember is that the :stop value represents the first value that is not in the selected slice. So, the difference between stop and start is the number of elements selected (if step is 1, the default).

#The other feature is that start or stop may be a negative number, which means it counts from the end of the array instead of the beginning. So:

a[-1]    # last item in the array
a[-2:]   # last two items in the array
a[:-2]   # everything except the last two items
```
