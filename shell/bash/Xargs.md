# xargs

Use `xargs` to run a command with a string that you want to break into multiple parameters ([SO](https://stackoverflow.com/a/39598334/125246)):

```bash
echo "arg1 arg2" | xargs my-command

# equivalent to
my-command arg1 arg2 
```

* Though watch out for line length and argument count!
* Better to use an array ([SO](https://stackoverflow.com/a/15857262/125246)) `test=(One "This is two" Three)`

To call functions from `xargs`, first `export -f` them ([SO](https://stackoverflow.com/a/11003457/125246)):

```bash
function echo_var() { .... }
export -f echo_var
seq -f "n%04g" 1 100 | xargs -n 1 -P 10 -I {} bash -c 'echo_var "$@"' _ {}
```