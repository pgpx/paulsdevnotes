# Bash arguments

Use `xargs` to run a command with a string that you want to break into multiple parameters ([SO](https://stackoverflow.com/a/39598334/125246)):

```bash
echo "arg1 arg2" | xargs my-command

# equivalent to
my-command arg1 arg2 
```

* Though watch out for line length and argument count!
* Better to use an array ([SO](https://stackoverflow.com/a/15857262/125246)) `test=(One "This is two" Three)`