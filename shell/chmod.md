# chmod

* Fix permissions in a directory ([SO](https://serverfault.com/a/35079/126442))

```bash
find Dev -type d -print0 | xargs -0 chmod 0700
find Dev -type f -print0 | xargs -0 chmod 0600
find Dev -name *.sh -type f -print0 | xargs -0 chmod 0700
```