# Python Scripting

```bash
#!/usr/bin/env python3
```

Script arguments:

* `import sys`
* `sys.argv` - command-line arguments (`sys.argv[0]` is command name, `sys.argv[1]` is first argument, etc.)

Get current script's directory ([SO](https://stackoverflow.com/q/4934806/125246))

```python
import os
print os.getcwd()
```

## Argument parser

TODO complete this!

```python
parser = argparse.ArgumentParser(...)
```
