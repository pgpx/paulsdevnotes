# Bash Terminal Output

* [ANSI/VT100 Terminal Control Escape Sequences](http://www.termsys.demon.co.uk/vtansi.htm)

* [Is this terminal interactive?](https://www.gnu.org/software/bash/manual/html_node/Is-this-Shell-Interactive_003f.html) - examine the variable `PS1`; it is unset in non-interactive shells, and set in interactive shells:

    ```bash
    if [ -z "$PS1" ]; then
            echo This shell is not interactive
    else
            echo This shell is interactive
    fi
    ```
    
    
Use `printf` to portably output escape characters, e.g. to overwrite the current line ([SO](https://stackoverflow.com/a/238094/125246), see also [SO spinner](https://stackoverflow.com/a/3330834/125246)):

```bash
printf "#### (50%%)\r" && printf "##### (60%%)"
```

Output colours using `tput` ([SO](https://unix.stackexchange.com/a/10065/32390):

```bash
# check if stdout is a terminal...
if test -t 1; then

    # see if it supports colors...
    ncolors=$(tput colors)

    if test -n "$ncolors" && test $ncolors -ge 8; then
        bold="$(tput bold)"
        underline="$(tput smul)"
        standout="$(tput smso)"
        normal="$(tput sgr0)"
        black="$(tput setaf 0)"
        red="$(tput setaf 1)"
        green="$(tput setaf 2)"
        yellow="$(tput setaf 3)"
        blue="$(tput setaf 4)"
        magenta="$(tput setaf 5)"
        cyan="$(tput setaf 6)"
        white="$(tput setaf 7)"
    fi
fi

echo "${red}error${normal}"
echo "${green}success${normal}"

echo "${green}0.052${normal} ${bold}${green}2,816.00 kb${normal}"
```