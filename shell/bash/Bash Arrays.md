# Bash Arrays

* <https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays>

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