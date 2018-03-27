# Python I/O

Print to STDOUT (arguments separated by spaces) ([ref](https://www.safaribooksonline.com/library/view/programming-in-python/9780321699909/ch01.html)):

```python
print("Hello", "World!")
```

Write to a file:

```python
log = open("name.log", "a")
log.write("Hello")
log.close()
```

* Read from stdin ([SO](https://stackoverflow.com/questions/1450393/how-do-you-read-from-stdin-in-python))
