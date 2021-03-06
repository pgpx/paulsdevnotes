# Python Dates

* [datetime](https://docs.python.org/2/library/datetime.html)
* [time](https://docs.python.org/2/library/time.html)
* [pytz](https://pypi.python.org/pypi/pytz/)
* <https://www.epochconverter.com/> - Convert epoch to human readable date and vice versa

Current UTC timestamp in ISO format ([SO](https://stackoverflow.com/a/53623334/125246)):

```python
from datetime import datetime
now = datetime.utcnow().isoformat()
```

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


* But ([SO](https://stackoverflow.com/a/6999787/125246)):
** `'%s'` in `strftime` is not always supported in Python (e.g. in Windows)
** `.timetuple()` returns `tm_isdst=-1` and so forces `mktime()` to guess the timezone (so might be wrong in DST)
** `'%s'` and `mktime()` may use the wrong UTC offsets from the past.
** Best to always use `pytz`

## [pytz](https://pypi.python.org/pypi/pytz/)

```python
import pytz
utz = pytz.utc
```

## Pendulum

* <https://pendulum.eustace.io/>
* <https://github.com/sdispater/pendulum>
* <https://stackoverflow.com/a/25427822/125246>

Subclass of `datetime` with some helper functions and constructors.

```bash
import pendulum
import pytz
utc_hour = pendulum.from_timestamp(timestamp, pytz.utc).hour

london_tz = pytz.timezone('Europe/London')
pendulum.from_timestamp(timestamp, london_tz).replace(hour=0, minute=0, second=0)
```

Add periods, respecting summer time (so adding one day might add 23, 24, or 25 hours):

```bash
df = pendulum.from_timestamp(timestamp, london_tz)
dt.copy().add(days=1)
```