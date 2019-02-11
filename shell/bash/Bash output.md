# Bash output

## File descriptors

Echo to stderr ([SO](https://stackoverflow.com/a/23550347/125246))

* `>&2` something written on file descriptor 1 (stdout) will go to where descriptor 2 (stderr) goes ([redirection tutorial](http://wiki.bash-hackers.org/howto/redirection_tutorial))

```bash
>&2 echo "error"

# To avoid interaction with other redirections use subshell
(>&2 echo "error")
```

