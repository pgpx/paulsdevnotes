# Python Dataclasses

* <https://docs.python.org/3/library/dataclasses.html>
* <https://towardsdatascience.com/data-classes-in-python-8d1a09c1294b>

## JSON

Writing as JSON - use a custom encoder ([SO](https://stackoverflow.com/a/51286749/125246)):

```python
import dataclasses, json

class EnhancedJSONEncoder(json.JSONEncoder):
        def default(self, o):
            if dataclasses.is_dataclass(o):
                return dataclasses.asdict(o)
            return super().default(o)

json.dumps(foo, cls=EnhancedJSONEncoder)
```

* Other methods: ([SO](https://stackoverflow.com/a/62716669/125246))

Parse JSON - read as a dict and then use [dacite](https://github.com/konradhalas/dacite) ([SO](https://stackoverflow.com/a/53713336/125246)):

```python
from dacite import from_dict
user = from_dict(data_class=User, data=data)user = from_dict(data_class=User, data=data)
```