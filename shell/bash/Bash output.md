# Bash output

* [Displaying seconds as days/hours/mins/seconds?](https://unix.stackexchange.com/questions/27013/displaying-seconds-as-days-hours-mins-seconds)

## Redirection

* <https://tldp.org/LDP/abs/html/io-redirection.html>
* <https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_08_02.html#sect_08_02_03>

### File descriptors

Echo to stderr ([SO](https://stackoverflow.com/a/23550347/125246))

* `>&2` something written on file descriptor 1 (stdout) will go to where descriptor 2 (stderr) goes ([redirection tutorial](http://wiki.bash-hackers.org/howto/redirection_tutorial))

```bash
echo "error" >&2

# To avoid interaction with other redirections use subshell
(>&2 echo "error")
```

### Logging functions

Force logging to a screen, even if STDOUT is redirected ([SO](https://stackoverflow.com/a/18101327/125246), [SO](https://stackoverflow.com/a/18581814/125246))
```bash
# Open a new file descriptor that redirects to stdout:
exec 3>&1

log ()
{
    echo "Log message: $1" 1>&3
}
```