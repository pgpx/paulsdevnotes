# Bash Temporary Directories

Create a temp directory, and delete it once the script exits ([SO](https://stackoverflow.com/a/53063602/125246))

```bash
# https://stackoverflow.com/a/53063602/125246
tempdir=$(mktemp -d)

# Exit if the temp directory wasn't created successfully.
if [ ! -d "$tempdir" ]; then
    >&2 echo "Failed to create temp directory"
    exit 1
fi

# Make sure the temp directory gets removed on script exit.
trap 'rm -rf "$tempdir"' EXIT
```