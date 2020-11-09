# Bash Strings

## Newlines ([SO](http://stackoverflow.com/a/8467448/125246))
```bash
echo -e "Hello\nworld"
echo -e 'Hello\nworld'
echo Hello$'\n'world
```
Or `printf` ([SO](http://stackoverflow.com/a/8467449/125246))
```bash
printf "hello\nworld\n"
```

## Multiline

Use heredocs to output multiple lines ([SO](https://stackoverflow.com/a/23930212/125246))

```bash
cat << EOF
This is line 1.
Line 2.
EOF
```

Send to a file:

```bash
cat > test << EOM
Line 1.
Line 2.
EOM
```

Store in a variable:

```bash
read -r -d '' VAR << EOM
This is line 1.
This is line 2.
Line 3.
EOM
``` 


## String manipulation with sed
```bash
echo $1 | sed "s,/$,,"         # substitute, use , as delimiter, remove trailing slash
```

## tr
[Convert string to lowercase](http://stackoverflow.com/questions/2264428/converting-string-to-lower-case-in-bash-shell-scripting)
```bash
echo $a | tr '[A-Z]' '[a-z]'
a="$(tr [A-Z] [a-z] <<< "$a")"
```

## awk

Get a value from a properties file (key=value) (assuming value doesn't contain another =) [SO](http://stackoverflow.com/a/20378117/125246)

```bash
my_value=$(awk -F= '$1=="my.key" {print $2}' my_file.properties)
```

## Regex

[Linux Journal ref](http://www.linuxjournal.com/content/bash-regular-expressions)

```bash
if [[ ! "$instance" =~ ^ebd0[0-9]ee$ ]]; then
```

## Replace a substring ([SO](https://stackoverflow.com/a/13210909/125246))

Ref: [Bash Reference Manual, §3.5.3 "Shell Parameter Expansion"](https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameter-Expansion)

```bash
firstString="I love Suzi and Marry"
secondString="Sara"
echo "${firstString/Suzi/$secondString}"    # prints 'I love Sara and Marry'
```

To replace all occurrences, `use ${parameter//pattern/string}`

```bash
message='The secret code is 12345'
echo "${message//[0-9]/X}"           # prints 'The secret code is XXXXX'

```

