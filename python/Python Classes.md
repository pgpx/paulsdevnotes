# Python Classes

* [Python Tutorial](https://docs.python.org/3/tutorial/classes.html)

Python has no privacy model ([SO](https://stackoverflow.com/a/20261595/125246)), but has name mangling:

> [*Private name mangling:*](https://docs.python.org/3/reference/expressions.html#atom-identifiers) When an identifier that textually occurs in a class definition begins with two or more underscore characters and does not end in two or more underscores, it is considered a private name of that class. Private names are transformed to a longer form before code is generated for them. The transformation inserts the class name, with leading underscores removed and a single underscore inserted, in front of the name. For example, the identifier `__spam` occurring in a class named Ham will be transformed to `_Ham__spam`. This transformation is independent of the syntactical context in which the identifier is used. If the transformed name is extremely long (longer than 255 characters), implementation defined truncation may happen. If the class name consists only of underscores, no transformation is done.

* [Python’s super() considered super!](https://rhettinger.wordpress.com/2011/05/26/super-considered-super/)

## Properties

* [Using @property versus getters and setters](https://stackoverflow.com/questions/6618002/using-property-versus-getters-and-setters)


## Equality

[SO](https://stackoverflow.com/a/390640/125246)

```python
def __eq__(self, other):
        if isinstance(other, self.__class__):
            return self.__dict__ == other.__dict__
        else:
            return False
```

Or more strictly:

```python
def __eq__(self, other):
    if type(other) is type(self):
        return self.__dict__ == other.__dict__
    return False
```

## with

* <https://effbot.org/zone/python-with-statement.htm>


> When the “with” statement is executed, Python evaluates the expression, calls the __enter__ method on the resulting value (which is called a “context guard”), and assigns whatever __enter__ returns to the variable given by as. Python will then execute the code body, and no matter what happens in that code, call the guard object’s __exit__ method.

```python
    class controlled_execution:
        def __enter__(self):
            // set things up
            return thing

        def __exit__(self, type, value, traceback):
            //tear things down
            //return isinstance(value, TypeError)   - can look at exception

        def __exit__(self, type, value, traceback):
            
    with controlled_execution() as thing:
         some code
```
