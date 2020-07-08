# Python Dictionaries/Maps

* <https://docs.python.org/2.7/tutorial/datastructures.html#dictionaries>
* <https://docs.python.org/2.7/library/stdtypes.html#dict>

From 3.7, insertion order is iteration order,

```python
# Test for key
if key in obj:
# Get value (error if not found)
obj[key]
# Get value or default if not found
obj.get(key, default)
```

Create a dictionary with a list comprehension using [dict comprehension syntax](https://www.python.org/dev/peps/pep-0274/) ([SO](https://stackoverflow.com/a/1747827/125246)):

```python
my_dict = {key: value for (key, value) in iterable}
```

## Remove a key: ([SO](https://stackoverflow.com/a/11277439/125246))

```python
if 'key' in my_dict:
    del my_dict['key']
```

Or:

```python
val = my_dict.pop('key', None)
```
    
* This will return my_dict[key] if key exists in the dictionary, and None otherwise. If the second parameter is not specified (ie. my_dict.pop('key')) and key does not exist, a KeyError is raised.

## Sorting

Sort-by-value ([SO](https://stackoverflow.com/a/613218/125246)) - also see [OrderedDict](https://docs.python.org/3/library/collections.html#ordereddict-examples-and-recipes)
```python
import operator
x = {1: 2, 3: 4, 4: 3, 2: 1, 0: 0}
sorted_x = sorted(x.items(), key=operator.itemgetter(1), reverse=True)
```

