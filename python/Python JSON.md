# Python JSON

* <https://docs.python.org/3/library/json.html>


```python
import json
```

Parse a string:

```python
parsed = json.loads(json_string)
```

Output as a string (formatted):

```python
print(json.dumps(json_obj, sort_keys=True, indent=4))
```

Convert sets to sorted lists (modified from [SO](https://stackoverflow.com/a/8230505/125246)), and using sorted keys ([SO](https://stackoverflow.com/a/36336386/125246)):
```python
class JSONSetEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, collections.Set):
            res = list(obj)
            res.sort()
            return res
        else:
            return json.JSONEncoder.default(self, obj)

print json.dumps(my_obj, indent=4, sort_keys=True, cls=JSONSetEncoder)
```

