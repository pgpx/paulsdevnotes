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

Delete non-alphanumerics  ([SO](https://stackoverflow.com/a/20007549/125246))

```bash
echo "Â10.41.89.50-._ " | tr -cd '[[:alnum:]]._-'
```

    Though for MacOS, [[:alnum:]] might include some non-ASCII characters, so:

    ```bash
    "Â10.41.89.50-._ /" | tr -cd '[a-zA-Z0-9]._-'
    ```
    
Convert to lowercase and replace non-alphanumerics with '-'    

```bash
echo "Test/a/b.cd" | tr '[[A-Z]]' '[[a-z]]' | tr -c '[[a-z0-9]]\n' '-'
```

Complex regex substitution ([SO](https://unix.stackexchange.com/a/78626/32390)):

```bash
sed -i -E "s/(<username>.+)name(.+<\/username>)/\1something\2/" file.xml
```