# Python argparse

* <https://docs.python.org/2/library/argparse.html>
* Alternative: [Click](https://click.palletsprojects.com/en/7.x/)

Create a parent parser if you want the same option to be added to multiple subparsers ([SO](https://stackoverflow.com/a/56595689/125246)):

```python
# Create parent subparser. Note `add_help=False` and creation via `argparse.`
parent_parser = argparse.ArgumentParser(add_help=False)
parent_parser.add_argument('-p', help='add db parameter', required=True)

parser_create = subparsers.add_parser("create", parents=[parent_parser],
                                      help='Create something')
```

Require non-empty string value for an argument, if specified; otherwise `--image=` will be treated as an empty string value.  Use a [type](https://docs.python.org/3/library/argparse.html#type) function (idea from [SO](https://stackoverflow.com/a/55063765/125246)):

```python
def non_empty_str(val):
    if isinstance(val, str) and len(val) >= 1:
        return val
    raise argparse.ArgumentTypeError(f"{val} is not a non-empty string")

parser.add_argument('--image', '-i', type=non_empty_str)
```