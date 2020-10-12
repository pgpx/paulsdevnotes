# Python Type Hints

* <https://docs.python.org/3/library/typing.html>
* <https://mypy.readthedocs.io/en/stable/cheat_sheet_py3.html>
Forward evaluation of type hints ([SO](https://stackoverflow.com/a/55344418/125246)) - converts hint annotations to strings, which should be faster.

```python
from __future__ import annotations 
```

* Use `Sequence` for `List` or `Tuple` ([SO](https://stackoverflow.com/a/42486054/125246)):

    ```python
    bar: Sequence[int]
    ```