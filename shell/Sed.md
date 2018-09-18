# Sed

Remove all comments from a file (in-place) ([SO](http://stackoverflow.com/a/8206295/125246)):

```sh
# Don't need '' if not on a Mac/BSD
sed -i '' '/^#/d' filepath
```

Search and replace from STDIN ([SO](https://stackoverflow.com/a/9984761/125246)):

```bash
echo 'hello hello' | sed -e 's/el/zz/g'
``` 