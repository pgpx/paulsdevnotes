# Sed

Remove all comments from a file (in-place) ([SO](http://stackoverflow.com/a/8206295/125246)):

```sh
# Don't need '' if not on a Mac/BSD
sed -i '' '/^#/d' filepath
```
