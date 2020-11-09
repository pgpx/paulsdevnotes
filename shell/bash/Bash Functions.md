# Bash Functions

## User functions
```bash
function my_func() {
    echo $1 $2 $3;         # Arguments are given as $1, etc.
}

NATCO=$(remove_slash "$NATCO")    # Prefer to call functions using $(func_name ...)
```

## Return a boolean from a function [SO](https://stackoverflow.com/a/43840545/125246)

* `0` means success, non-zero means failure.
* `return [n]` - Cause a shell function to stop executing and return the value n to its caller. If n is not supplied, the return value is the exit status of the last command executed in the function. [ref](https://www.gnu.org/software/bash/manual/bash.html#index-return)
* By default a function's return status is the exit status of the last command executed. [ref](https://www.gnu.org/software/bash/manual/bash.html#Shell-Functions)
* `$?` expands to the exit status of the most recently executed foreground pipeline. [ref](https://www.gnu.org/software/bash/manual/bash.html#index-_0024_003f)
* A pipeline is a sequence of one or more commands separated by one of the control operators `|` or `|&`. [ref](https://www.gnu.org/software/bash/manual/bash.html#Pipelines)

```bash
01  function i_should(){
02      uname="$(uname -a)"
03
04      [[ "$uname" =~ Darwin ]] && return
05
06      if [[ "$uname" =~ Ubuntu ]]; then
07          release="$(lsb_release -a)"
08          [[ "$release" =~ LTS ]]
09          return
10      fi
11
12      false
13  }
14
15  function do_it(){
16      echo "Hello, old friend."
17  }
18
19  if i_should; then
20    do_it
21  fi
```