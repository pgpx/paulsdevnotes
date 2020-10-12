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

Read from a gzip file: ([SO](https://stackoverflow.com/a/30062604/125246))

```python
import gzip
fd = gzip.open(path, 'r', encoding='utf-8')
```

## Read a line from STDIN

* <https://docs.python.org/3/library/functions.html#input> ([SO](https://stackoverflow.com/a/1135035/125246))
```python
s = input('prompt -->')
```

* Strips trailing newline
* Also see <https://docs.python.org/3/library/readline.html#module-readline>


## Progress bar

[tqdm](https://github.com/tqdm/tqdm) ([SO](https://stackoverflow.com/a/26394657/125246))

```python
from tqdm import tqdm
for v in tqdm(fd, desc='File entries processed', unit=' entries'):
```

## File and Directory Access

* Python Reference: [File and Directory Access](https://docs.python.org/3/library/filesys.html)
* [`os`](https://docs.python.org/3/library/os.html#files-and-directories)

```import os.path```

### [`pathlib`](https://docs.python.org/3/library/pathlib.html#module-pathlib) - object-oriented filesystem paths

O/S independent - probably what you need!

```python
from pathlib import Path
p = Path('.')

# listing subdirectories
[x for x in p.iterdir() if x.is_dir()]

# glob
list(p.glob('**/*.py'))

# navigating
q = p / 'init.d' / 'reboot'

# querying
q.exists()
q.is_dir()

# opening
with q.open() as f: f.readline()
```

### [`os.path`](https://docs.python.org/3/library/os.path.html) - Common pathname manipulations

File exists?

```python
if os.path.exists(filename):
```
### Copy one file to another ([SO](https://stackoverflow.com/a/15343861/125246))

```python
with open("in.txt") as f:
    with open("out.txt", "w") as f1:
        for line in f:
            if "ROW" in line:
                f1.write(line) 
```