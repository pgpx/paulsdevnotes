# Python Logging

* `from rich.pretty import pprint` - Pretty printer

* Python [logging module](https://docs.python.org/3/library/logging.html)

Try removing all handlers if not logging ([SO](https://stackoverflow.com/a/51843943/125246)):

```python
for handler in logging.root.handlers[:]:
    logging.root.removeHandler(handler)

logging.basicConfig(filename='output.log', level=logging.INFO)
```