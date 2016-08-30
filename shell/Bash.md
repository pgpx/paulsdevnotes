# [Bash](http://www.gnu.org/software/bash/)

* [Official FAQ](http://tiswww.case.edu/php/chet/bash/FAQ)
* [BashFAQ](http://mywiki.wooledge.org/BashFAQ/), [Bash Pitfalls](http://mywiki.wooledge.org/BashPitfalls)
* [Bash Guide for Beginners](http://tldp.org/LDP/Bash-Beginners-Guide/html/)
* [Use the Unofficial Bash Strict Mode](http://redsymbol.net/articles/unofficial-bash-strict-mode/)

## Books
* [Learning the Bash Shell, 3rd Ed. O'Reilly](https://www.safaribooksonline.com/library/view/learning-the-bash/0596009658/)
* [Bash Cookbook, O'Reilly.](https://www.safaribooksonline.com/library/view/bash-cookbook/0596526784/)
* [Pro Bash Programming : Scripting the GNU/Linux Shell, Second Edition](https://www.safaribooksonline.com/library/view/pro-bash-programming/9781484201213/)

## Running scripts
Run a script from a pipe with arguments [SO](http://stackoverflow.com/a/14693303/125246)
```bash
cat script | bash -s 5
```

Run a command as another user using [runuser](http://linux.die.net/man/1/runuser):
```bash
runuser -s /bin/bash tomcat -c "$APP_HOME/startServer.sh"
```

Run a string as a command using `eval` ([SO](http://stackoverflow.com/a/2355242/125246))
```bash
eval $mycommand
```

Ignore `STDERR` with `2>/dev/null` ([ref](http://ubuntuforums.org/showthread.php?t=336696))
```bash
ls something_you_wont_find 2>/dev/null
```

## Shell info
```bash
# Bash version
echo $BASH_VERSION

# Current shell
echo $SHELL
```

# Filename wildcards
* Any single char - `?`
* Any string of chars - `*`
* Any character in set - `[set]`
* Any character not in set - `[!set]`

## ['strict mode'](http://redsymbol.net/articles/unofficial-bash-strict-mode/)

```bash
#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
```

* `-e` - halt if any command has a non-zero exit status (unless combined in a boolean expression)
* `-u` - halt if accessing any undefined variable (except `$*` and `$@`)
* `-o pipefail` - halt if any step in a pipeline fails
* `IFS=$'\n\t'` - separate words with tabs and newlines (not spaces, for better loop iteration)

## Arguments
[Iterate over arguments passed to script](http://stackoverflow.com/a/4528563/125246)
```bash
for FILE in "$@"; do     # Does not lose whitespace in arguments
```

[Use default if variable is not defined](http://www.cyberciti.biz/faq/bash-ksh-if-variable-is-not-defined-set-default-variable/)
```bash
output=${1-text}
output=${1:-text}
```

## Get the full path to the current script ([SO](http://stackoverflow.com/a/9107028/125246), [SO](http://stackoverflow.com/a/4774063/125246))

```bash
SCRIPT_DIR_PATH=$( cd "$(dirname "$0")" ; pwd -P )
# or
ABSOLUTE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
```

Won't work if the file is a symlink or found in the `$PATH`.

## Globbing

[linuxjournal](http://www.linuxjournal.com/content/bash-extended-globbing) 

* `ls *.jpg` - `*` match 0-many chars (`*` doesn't match filenames that start with `.`)
* `ls ?.jpg` - `?` match 1 char   # List JPEG files with 1 char names (eg a.jpg, 1.jpg)
* `rm [A-Z]*.jpg` - `[]` match a range of chars (once).
* `shopt -s extglob` - enable extended globbing.

## Syntax

If/else ([Introduction to if](http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html))
```bash
if condition          # Or: if condition; then
then
   statements
[elif condition
   then statements...]
[else
   statements]
fi
```

Conditions: (Learning the Bash Shell, 3rd ed, O'Reilly, page 117)
```
Logical operators: [ condition ] && [condition] || ... ! ... \( \)
    -a -o    # Like && and ||, but can only be used in test conditional expressions.

String comparisons: [str1 = str2]  [str1 != str2] [str1 < str2] [str1 > str2]
     [-n str1] # Not null (length > 0)
     [-z str1] # Null (length = 0)
```

Case: ([SO](http://stackoverflow.com/a/25482040/125246))
```bash
case $i in
  1|2|5) echo "Not OK"; ;;
  9|10|12) echo "may be ok"; ;;
  *) echo "no clue - $i"; ;;
esac;
```

Exit status `$?` ([SO](http://stackoverflow.com/a/31348007/125246)):
```bash
command1
if [ $? -ne 0]; then

# or
if ! command1; then
```

## Arrays:
```bash
# Add value to an array:
myarray+=('new value')

# Is array empty?
if [ -z "$myarray+1" ]; then
# Not empty:
if [ -n "$myarray+1"]; then

# Array, Value - does the array contain the value?
contains() {
  for v in $1; do
    if [ "$v" = "$2" ]; then
      echo '1'
    fi
  done
}

# Default values:
for CC in ${natcos[@]:-AT AL BK BU CS DE HR HY CZ GR HU MK ME NL PL RO SK TE ZZ}; do
```

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

## [set](http://ss64.com/bash/set.html)

```
# Use + instead of - to turn off the option
-e  Exit immediately if a simple command exits with a non-zero status, unless
       the command that fails is part of an until or  while loop, part of an
       if statement, part of a && or || list, or if the command's return status
       is being inverted using !.  -o errexit
-u  Treat unset variables as an error when performing 
       parameter expansion. An error message will be written 
       to the standard error, and a non-interactive shell will exit. -o nounset
--  If no arguments follow this option, then the positional parameters are unset. 
       Otherwise, the positional parameters are set to the arguments, 
       even if some of them begin with a `-'. 
```

## For loop
```bash
for variable in value1 value2; do
   my-command $variable
done

for NATCO in `svn ls file://$REPO/editions`; do
```

To loop over script arguments, first use shift to remove the first argument(s) and then loop over the rest ([ref](http://stackoverflow.com/a/2701429/125246)):

```bash
fistitem=$1
shift;
for item in "$@" ; do
  #process item
done
```

## [shift](http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_09_07.html)

Shift the positional parameters 'to the left' by its argument (defaults to 1).

## String manipulation with sed
```bash
echo $1 | sed "s,/$,,"         # substitute, use , as delimiter, remove trailing slash
```

## User functions
```bash
function my_func() {
    echo $1 $2 $3;         # Arguments are given as $1, etc.
}

NATCO=$(remove_slash "$NATCO")    # Prefer to call functions using $(func_name ...)
```

## Handling arguments

Raw or with `getopts` ([SO](http://stackoverflow.com/a/14203146/125246))

## Strings

### Newlines ([SO](http://stackoverflow.com/a/8467448/125246))
```bash
echo -e "Hello\nworld"
echo -e 'Hello\nworld'
echo Hello$'\n'world
```
Or `printf` ([SO](http://stackoverflow.com/a/8467449/125246))
```bash
printf "hello\nworld\n"
```

### tr
[Convert string to lowercase](http://stackoverflow.com/questions/2264428/converting-string-to-lower-case-in-bash-shell-scripting)
```bash
echo $a | tr '[A-Z]' '[a-z]'
a="$(tr [A-Z] [a-z] <<< "$a")"
```

### awk

Get a value from a properties file (key=value) (assuming value doesn't contain another =) [SO](http://stackoverflow.com/a/20378117/125246)

```bash
my_value=$(awk -F= '$1=="my.key" {print $2}' my_file.properties)
```

### Regex

[Linux Journal ref](http://www.linuxjournal.com/content/bash-regular-expressions)

```bash
if [[ ! "$instance" =~ ^ebd0[0-9]ee$ ]]; then
```

## Paths
* [Absolute path](http://stackoverflow.com/a/3915420/125246)
```bash
function abspath() { echo "$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"; }
```

* [Directory containing the current script](http://stackoverflow.com/a/246128/125246)
```bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
```

## xargs

Run the given command multiple times (once for each piped argument)
```sh
# -t - echo each command
# -I {} - replace {} in the command with the argument
find . -type d -depth 1 | xargs -tI {} git -C {} branch -avv
```

Multiple commands ([SO](http://stackoverflow.com/a/6958957/125246))
```sh
# Where commands can contain %
cat a.txt | xargs -I % sh -c 'command1; command2; ...'
# Or
< a.txt xargs -I % sh -c 'command1; command2; ...'
```

* [Determine the path of the executing BASH script](http://stackoverflow.com/questions/630372/determine-the-path-of-the-executing-bash-script)
```bash
#For the relative path (i.e. the direct equivalent of Windows' %~dp0):
MY_PATH="`dirname \"$0\"`"
echo "$MY_PATH"

#For the absolute, normalized path:
MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
if [ -z "$MY_PATH" ] ; then
  # error; for some reason, the path is not accessible
  # to the script (e.g. permissions re-evaled after suid)
  exit 1  # fail
fi
echo "$MY_PATH"
```

## sleep ([SO](http://stackoverflow.com/a/21621163/125246))

```bash
sleep .5 # Waits 0.5 second.
sleep 5  # Waits 5 seconds.
sleep 5s # Waits 5 seconds.
sleep 5m # Waits 5 minutes.
sleep 5h # Waits 5 hours.
sleep 5d # Waits 5 days.
```

## Processes

Check whether a process is running:
```bash
if ps --pid $PID; then

# Or look for command
# (Just executable name, but not full path of executable)
ps -C httpd -o pid= | xargs kill
```

List child process ids ([ps](http://linux.die.net/man/1/ps))
```bash
# -o pid=     Output only the process id
# --ppid 423  Output only processes whose ppid (parent process id) is 423

ps -o pid= --ppid 423
```

[pkill](http://linux.die.net/man/1/pkill) - kill all child processes of the specified process (if killing the parent won't work)
```bash
pkill -TERM -P $(cat appserver.pid)
```

Or maybe ([SO](http://stackoverflow.com/questions/392022/best-way-to-kill-all-child-processes))

## Functions
```
read -  (e.g. ask user for input)
read [-ers] [-a aname] [-d delim] [-i text] [-n nchars] [-N nchars] [-p prompt] [-t timeout] [-u fd] [name
...]
One line is read from the standard input, or from the file descriptor fd supplied as an argument to
the -u option, and the first word is assigned to the first name, the second word to the second name,
and so on, with leftover words and their intervening separators assigned to the last name. If there
are fewer words read from the input stream than names, the remaining names are assigned empty values.
The characters in IFS are used to split the line into words. The backslash character (\) may be used
to remove any special meaning for the next character read and for line continuation. Options, if sup‐
plied, have the following meanings:
-a aname
The words are assigned to sequential indices of the array variable aname, starting at 0. aname
is unset before any new values are assigned. Other name arguments are ignored.
-d delim
The first character of delim is used to terminate the input line, rather than newline.
-e If the standard input is coming from a terminal, readline (see READLINE above) is used to
obtain the line. Readline uses the current (or default, if line editing was not previously
active) editing settings.
-i text
If readline is being used to read the line, text is placed into the editing buffer before edit‐
ing begins.
-n nchars
read returns after reading nchars characters rather than waiting for a complete line of input,
but honor a delimiter if fewer than nchars characters are read before the delimiter.
-N nchars
read returns after reading exactly nchars characters rather than waiting for a complete line of
input, unless EOF is encountered or read times out. Delimiter characters encountered in the
input are not treated specially and do not cause read to return until nchars characters are
read.
-p prompt
Display prompt on standard error, without a trailing newline, before attempting to read any
input. The prompt is displayed only if input is coming from a terminal.
-r Backslash does not act as an escape character. The backslash is considered to be part of the
line. In particular, a backslash-newline pair may not be used as a line continuation.
-s Silent mode. If input is coming from a terminal, characters are not echoed.
-t timeout
Cause read to time out and return failure if a complete line of input is not read within time‐
out seconds. timeout may be a decimal number with a fractional portion following the decimal
point. This option is only effective if read is reading input from a terminal, pipe, or other
special file; it has no effect when reading from regular files. If timeout is 0, read returns
success if input is available on the specified file descriptor, failure otherwise. The exit
status is greater than 128 if the timeout is exceeded.
-u fd Read input from file descriptor fd.

If no names are supplied, the line read is assigned to the variable REPLY. The return code is zero,
unless end-of-file is encountered, read times out (in which case the return code is greater than 128),
or an invalid file descriptor is supplied as the argument to -u.
```
