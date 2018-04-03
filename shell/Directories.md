# Shell - Directories

## Convert a relative directory to an absolute path

(e.g. for Docker volume mounts where relative path's can't be used)

Using `realpath` (that is not installed on OS/X) ([SO](https://stackoverflow.com/a/3915075/125246))]:

```bash
realpath example.txt
```

or ([SO](https://stackoverflow.com/a/3915776/125246)):

```bash
readlink -e /foo/bar/baz
readlink -m /foo/bar/baz  # Works if file does not exist, but not on OS/X
```

Simple & portable ([SO](https://stackoverflow.com/a/3915420/125246)) and ([SO](https://stackoverflow.com/a/21188136/125246)):

```bash
get_abs_filename() {
  # $1 : relative filename
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}
```

Or more complex (can handle directories, .., etc.) ([SO](https://stackoverflow.com/a/23002317/125246)):

```bash
function abspath() {
    # generate absolute path from relative path
    # $1     : relative filename
    # return : absolute path
    if [ -d "$1" ]; then
        # dir
        (cd "$1"; pwd)
    elif [ -f "$1" ]; then
        # file
        if [[ $1 = /* ]]; then
            echo "$1"
        elif [[ $1 == */* ]]; then
            echo "$(cd "${1%/*}"; pwd)/${1##*/}"
        else
            echo "$(pwd)/$1"
        fi
    fi
}
```