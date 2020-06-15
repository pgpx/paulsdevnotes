# Python Expressions

* <https://book.pythontips.com/en/latest/ternary_operators.html>

Ternary operators ([ref](https://book.pythontips.com/en/latest/ternary_operators.html)):

```python
value_if_true if condition else value_if_false
```

Also using a tuple, because `True == 1` and `False == 0` (but generally disliked, and both elements will be evaluated):

```python
(if_test_is_false, if_test_is_true)[test]
```

Default values ([SO](https://stackoverflow.com/a/4978745/125246)):

```python
other = s or "some default value"
```

... but watch out that s is not falsy (e.g. `0` or `""`)