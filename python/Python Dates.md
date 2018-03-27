# Python Dates

* [datetime](https://docs.python.org/2/library/datetime.html)
* [time](https://docs.python.org/2/library/time.html)

Convert to epoch timestamp ([SO](https://stackoverflow.com/a/7241238/125246)):

```python
import time
date_time = '29.08.2011 11:05:02'
pattern = '%d.%m.%Y %H:%M:%S'
epoch = int(time.mktime(time.strptime(date_time, pattern)))
```

Use [dateutil](https://dateutil.readthedocs.io/en/stable/index.html) to parse numeric timezone offsets (not supported by default) ([SO](https://stackoverflow.com/questions/1101508/how-to-parse-dates-with-0400-timezone-string-in-python)):

```python
from dateutil.parser import parse
d = parse('2009/05/13 19:19:30 -0400')
```

Epoch second to string ([SO](https://stackoverflow.com/a/12400584/125246)):

```python
time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(epoch_seconds))
```

