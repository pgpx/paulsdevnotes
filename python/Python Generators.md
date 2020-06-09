# Python Generators

Generator expressions are similar to list comprehensions, but use `()` instead of `[]` ([ref](https://wiki.python.org/moin/Generators)):

```python
# list comprehension
doubles = [2 * n for n in range(50)]

# same as the list comprehension above
doubles = list(2 * n for n in range(50))
```