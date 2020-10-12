# Python Tuples

* <https://wiki.python.org/moin/TupleSyntax>

```python
t = ()      # Empty tuple
t = (1,)    # Single element tuples must have a trailing comma
t = 1,      # Brackets are optional except for empty tuple
t = (val1, val2)
t = val1, val2
t = tuple([val1, val2])
```

Tuples can effectively be immutable lists ([SO](https://stackoverflow.com/a/11142398/125246)), but are more than that:
* <https://jtauber.com/blog/2006/04/15/python_tuples_are_not_just_constant_lists/>
* <https://docs.python.org/3/tutorial/datastructures.html#tuples-and-sequences>
    > Tuples are immutable, and usually contain a heterogeneous sequence of elements that are accessed via unpacking (see later in this section) or indexing (or even by attribute in the case of namedtuples). Lists are mutable, and their elements are usually homogeneous and are accessed by iterating over the list.

## Tuple generator

Use `tuple(...)` (because `(...)` are already used for generator expressions) ([SO](https://stackoverflow.com/a/16940351/125246))

```python
tuple(i for i in (1, 2, 3))
```
                                                                      