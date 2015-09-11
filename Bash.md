# [Bash](http://www.gnu.org/software/bash/)

* [Official FAQ](http://tiswww.case.edu/php/chet/bash/FAQ)
* [BashFAQ](http://mywiki.wooledge.org/BashFAQ/), [Bash Pitfalls](http://mywiki.wooledge.org/BashPitfalls)
* [Bash Guide for Beginners](http://tldp.org/LDP/Bash-Beginners-Guide/html/)

## Books
* [Learning the Bash Shell, 3rd Ed. O'Reilly](https://www.safaribooksonline.com/library/view/learning-the-bash/0596009658/)
* [Bash Cookbook, O'Reilly.](https://www.safaribooksonline.com/library/view/bash-cookbook/0596526784/)
* [Pro Bash Programming : Scripting the GNU/Linux Shell, Second Edition](https://www.safaribooksonline.com/library/view/pro-bash-programming/9781484201213/)

## Running scripts
Run a script from a pipe with arguments [SO](http://stackoverflow.com/a/14693303/125246)
```bash
cat script | bash -s 5
```

## Shell info
```bash
# Bash version
echo $BASH_VERSION

# Current shell
echo $SHELL
```

# Filename wildcards
* Any single char - `?`
* Any string of chars - `*`
* Any character in set - `[set]`
* Any character not in set - `[!set]`

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

## For loop
```bash
for variable in value1 value2; do
   my-command $variable
done

for NATCO in `svn ls file://$REPO/editions`; do
```

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

## Paths
* [Absolute path](http://stackoverflow.com/a/3915420/125246)
```bash
function abspath() { echo "$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"; }
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
