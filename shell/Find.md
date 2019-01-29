# find

* Find and output only basename ([SO](https://stackoverflow.com/a/5458777/125246))

```bash
find ./dir1 -type f -exec basename {} \;
```

Loop over each file from a find: ([SO](https://stackoverflow.com/a/2087038/125246))

```bash
find . -name '*.txt' | while read line; do
    echo "Processing file '$line'"
done
```

Delete all lines starting with a `#`: ([SO]https://stackoverflow.com/a/8206295/125246))

```bash
sed '/^#/ d'
```