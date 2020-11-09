# Bash Arrays

* [You don't know Bash: An introduction to Bash arrays](https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays)
  
```shell script
allThreads=(1 2 4 8 16 32 64 128)
for t in ${allThreads[@]}; do
    ./pipeline --threads ${allThreads[$i]}
done
```

## [Syntax](https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays)

Syntax	        |  Result
--------------- | -------
`arr=()`        | Create an empty array
`arr=(1 2 3)`	| Initialize array
`${arr[2]}`	    | Retrieve third element
`${arr[@]}`	    | Retrieve all elements
`${!arr[@]}`	| Retrieve array indices
`${#arr[@]}`	| Calculate array size
`arr[0]=3`	    | Overwrite 1st element
`arr+=(4)`    	| Append value(s)
`str=$(ls)`	    | Save ls output as a string
`arr=( $(ls) )` | Save ls output as an array of files
`${arr[@]:s:n}` | Retrieve n elements starting at index s

## Examples

* Create an array:

    ```bash
    my_array=(val1 val2 val3 "val 4")
    ```
  
  Note that quoting a variable will add an empty element to the array, even if the variable is empty
  
* Append an array ([ref](https://linuxhint.com/bash_append_array/)):

    ```bash
    array+=('a' 'b')
    ```
  
* Number of elements in an array: `${#arr[@]}` ([SO](https://serverfault.com/a/924549/126442))
* Send an array as quoted arguments to a command using `"${arr[@]}"` ([AU](https://askubuntu.com/a/674347/36040))

    ```bash
    args=(-e arg2 --pin); ./scr.sh deploy "${args[@]}"
    ```
    * If bash >= 4.4 then an empty array is not an error and `"${args[@]}"` will not output any arguments.
    * If bash < 4.4 then an empty array is an error, so safe idiom is ([SO](https://stackoverflow.com/a/61551944/125246)):

    ```bash
    ${arr[@]+"${arr[@]}"}  
  ```

* Print an array using `$*` by concatenating based on `IFS`: `"My array: $array*"` or `"My array: " "${array[@]}"` ([SC2145](https://github.com/koalaman/shellcheck/wiki/SC2145))

  Only works for single-character delimiters, e.g. ([SO](https://stackoverflow.com/a/17841619/125246))
  
  ```bash
  function join_by { local IFS="$1"; shift; echo "$*"; }
  join_by , a b c #a,b,c
  ```
  
  Or multi-characters:
  ```bash
  function join_by { local d=$1; shift; local f=$1; shift; printf %s "$f" "${@/#/$d}"; }
  ```

* Convert a string to an array ([SO](https://stackoverflow.com/a/19657765/125246)):

    ```bash
    $ str="title1 title2 title3 title4 title5"
    $ arr=( $str )
    ```

    * But this will not work for Zsh; see <http://zsh.sourceforge.net/FAQ/zshfaq03.html>.  They suggest `set -A array one two three twenty` or `eval "words=($sentence)"`
    * Or `read -a array <<< $str` ([SO](https://stackoverflow.com/a/19657832/125246))

* Add `-` to the start of each value in an array ([SO](https://unix.stackexchange.com/a/29521/32390)):

    ```bash
    command "${my_array[@]/#/-}" "$1"
    ```

Add value to an array:
```bash
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

Array length ([ref](http://www.cyberciti.biz/faq/finding-bash-shell-array-length-elements/)):

```bash
${#ArrayName[#]}
```

Split a single comma-separated line into an array ([SO](http://stackoverflow.com/a/918931/125246)):

```bash
IFS=';' read -ra ADDR <<< "$IN"
for i in "${ADDR[@]}"; do
    # process "$i"
done
```

Or multiple lines (;-separated):

```bash
while IFS=';' read -ra ADDR; do
      for i in "${ADDR[@]}"; do
          # process "$i"
      done
done <<< "$IN"
```
