### Python Dictionaries/Maps

```python
# Test for key
if key in obj:
# Get value (error if not found)
obj[key]
# Get value or default if not found
obj.get(key, default)
```

Sort-by-value ([SO](https://stackoverflow.com/a/613218/125246)) - also see [OrderedDict](https://docs.python.org/3/library/collections.html#ordereddict-examples-and-recipes)
```python
import operator
x = {1: 2, 3: 4, 4: 3, 2: 1, 0: 0}
sorted_x = sorted(x.items(), key=operator.itemgetter(1), reverse=True)
```

