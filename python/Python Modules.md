# Python Modules

* Python Tutorial: [Modules](https://docs.python.org/3/tutorial/modules.html)
* Python Language Reference:
    * [The import system](https://docs.python.org/3/reference/import.html)
    * [The `import` statement](https://docs.python.org/3/reference/simple_stmts.html#the-import-statement)
* Learning Python, 5th Ed: [Import and Reload Basics](https://www.safaribooksonline.com/library/view/learning-python-5th/9781449355722/ch03.html#import_and_reload_basics)

## [`import`](https://docs.python.org/3/reference/simple_stmts.html#the-import-statement)

```python
import foo                 # foo imported and bound locally
import foo.bar.baz         # foo.bar.baz imported, foo bound locally
import foo.bar.baz as fbb  # foo.bar.baz imported and bound as fbb
from foo.bar import baz    # foo.bar.baz imported and bound as baz
from foo import attr       # foo imported and foo.attr bound as attr
from module import *       # bind all public names; only allowed at module level
                           # (not allowed in class or function definitions)
```