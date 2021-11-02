# Bash Conditionals

## Conditionally running commands ([SO](https://askubuntu.com/a/539293/36040))

```bash
A; B    # Run A and then B, regardless of success of A
A && B  # Run B if and only if A succeeded
A || B  # Run B if and only if A failed
A &     # Run A in background.
```

## Check if a command succeded ([SO](https://unix.stackexchange.com/a/22728/32390))

(Does not trigger `-e` errors)

```bash
if command ; then
    echo "Command succeeded"
else
    echo "Command failed"
fi
```

## Check if a variable is set [SO](https://stackoverflow.com/a/230593/125246)

```bash
if [ -z "${VAR+xxx}" ]; then echo VAR is not set at all; fi
```

## Compare strings ([SO](https://stackoverflow.com/a/2237103/125246))

```bash
if [ "$x" = "valid" ]; then
  echo "x has the value 'valid'"
fi
```

* Use quotes around strings in case the string is empty, otherwise you'll get a syntax error because the argument would disappear and become: `if [  = "valid" ]; then`

## Regex

```bash
if [[ "$val" =~ ^([0-9])+\.$ ]]; then
    num=${BASH_REMATCH[1]}
```

## Boolean operations

* [How-to: Use parentheses to group and expand expressions](https://ss64.com/bash/syntax-brackets.html)

[SO](https://stackoverflow.com/a/2237179/125246)

```bash
[ "$x" == "valid" ] && echo "x has the value 'valid'"
```

`&&` and `||` have the same precedence (in `[[ ]]`), so use round brackets `( )` to group ([USE](https://unix.stackexchange.com/a/88851/32390))
* They do short-circuit.

## File checks
* -a file file exists
* -d file file exists and is a directory
* -e file file exists; same as -a
* -f file file exists and is a regular file (i.e., not a directory or other special type of file)
* -r file You have read permission on file
* -s file file exists and is not empty
* -w file You have write permission on file
* -x file You have execute permission on file, or directory search permission if it is a directory
* -N file file was modified since it was last read
* -O file You own file
* -G file file’s group ID matches yours (or one of yours, if you are in multiple groups)
* `file1 -nt file2` - file1 is newer than file2 (modification times)
* `file1 -ot file2` - file1 is older than file2 (modification times)

## Integer conditionals
* -lt Less than
* -le Less than or equal
* -eq Equal
* -ge Greater than or equal
* -gt Greater than
* -ne Not equal
