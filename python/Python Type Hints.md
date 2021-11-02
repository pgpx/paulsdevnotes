# Python Type Hints

* <https://docs.python.org/3/library/typing.html>
* <https://mypy.readthedocs.io/en/stable/cheat_sheet_py3.html>
* [Pyright](https://github.com/Microsoft/pyright) - static type checker.


Forward evaluation of type hints ([SO](https://stackoverflow.com/a/55344418/125246)) - converts hint annotations to strings, which should be faster.

```python
from __future__ import annotations 
```

* Use `Sequence` for `List` or `Tuple` ([SO](https://stackoverflow.com/a/42486054/125246)):

    ```python
    bar: Sequence[int]
    ```
  
## Casting

([SO](https://stackoverflow.com/a/9112513/125246))

```python
from typing import cast                                                              
cast(int, 3.4)
```