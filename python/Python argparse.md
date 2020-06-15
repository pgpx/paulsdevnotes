# Python argparse

* <https://docs.python.org/2/library/argparse.html>

Create a parent parser if you want the same option to be added to multiple subparsers ([SO](https://stackoverflow.com/a/56595689/125246)):

```python
# Create parent subparser. Note `add_help=False` and creation via `argparse.`
parent_parser = argparse.ArgumentParser(add_help=False)
parent_parser.add_argument('-p', help='add db parameter', required=True)

parser_create = subparsers.add_parser("create", parents=[parent_parser],
                                      help='Create something')
```