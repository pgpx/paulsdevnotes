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

## [Change the output colour of echo](https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux)

* [ANSI escape codes](https://en.wikipedia.org/wiki/ANSI_escape_code) - see 3-bit and 4-bit section.

```
Black        0;30     Dark Gray     1;30
Red          0;31     Light Red     1;31
Green        0;32     Light Green   1;32
Brown/Orange 0;33     Yellow        1;33
Blue         0;34     Light Blue    1;34
Purple       0;35     Light Purple  1;35
Cyan         0;36     Light Cyan    1;36
Light Gray   0;37     White         1;37
```

```bash
RED='\033[0;31m'
NC='\033[0m' # No Color
printf "I ${RED}love${NC} Stack Overflow\n"
```

[Custom collapsible sections](https://docs.gitlab.com/ee/ci/jobs/#custom-collapsible-sections) - use `section_start` and `section_end`:
