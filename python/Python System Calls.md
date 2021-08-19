# Python System Calls

* [Plumbum](https://plumbum.readthedocs.io/en/latest/) - shell-script-like syntax, including pipes.  [GitHub](https://github.com/tomerfiliba/plumbum)

Use the [`subprocess`](https://docs.python.org/3/library/subprocess.html#module-subprocess) module.

Capture STDOUT as a string:

```python
proc = subprocess.run(cmd, check=True, stdout=subprocess.PIPE)
logger.debug(proc.stdout)
```

[shlex.quote](https://docs.python.org/3/library/shlex.html#shlex.quote) ([SO](https://stackoverflow.com/a/847800/125246))

> Return a shell-escaped version of the string s. The returned value is a string that can safely be used as one token in a shell command line, for cases where you cannot use a list.

```python
from shlex import quote
command = 'ls -l {}'.format(quote(filename))
```