# Python Files

## [os](https://docs.python.org/3/library/os.html) library

Make a directory (and any required parents):

```python
os.makedirs('dirname', mode=0o777, exist_ok=True)
```

Does a file or directory exist ([SO](https://stackoverflow.com/a/8933290/125246)):

```python
print(os.path.isdir("/home/el"))
print(os.path.exists("/home/el/myfile.txt"))
```

or using new [pathlib](https://docs.python.org/3/library/pathlib.html#) ([SO](https://stackoverflow.com/a/44228213/125246)):

```python
from pathlib import Path
p = Path('/usr')
p.exists()
p.is_dir()

# Can combine paths with /
q = p / 'bin' / 'vim'
```