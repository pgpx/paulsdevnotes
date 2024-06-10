# Python Functional

* <https://news.ycombinator.com/item?id=9529021>
  * <https://github.com/pytoolz/toolz>
  * <https://github.com/kachayev/fn.py>

# Parameters

Positional-only parameters ([PEP 570](https://peps.python.org/pep-0570/)):

Use `/` to separate positional parameters, `*` for keyword-only:

```python
def name(positional_only_parameters, /, positional_or_keyword_parameters,
         *, keyword_only_parameters): ...
```