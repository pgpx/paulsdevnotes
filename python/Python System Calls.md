# Python System Calls

* [Plumbum](https://plumbum.readthedocs.io/en/latest/) - shell-script-like syntax, including pipes.  [GitHub](https://github.com/tomerfiliba/plumbum)

Use the [`subprocess`](https://docs.python.org/3/library/subprocess.html#module-subprocess) module.

Capture STDOUT as a string:

```python
proc = subprocess.run(cmd, check=True, stdout=subprocess.PIPE)
logger.debug(proc.stdout)
```