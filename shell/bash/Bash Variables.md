# Bash Variables

* Unset (delete) a variable

    ```bash
    unset VAR
    ```
* Check if a variable is set ([SO](https://stackoverflow.com/a/13864829/125246)):
    ```bash
    if [ -z ${var+x} ]; then echo "var is unset"; else echo "var is set to '$var'"; fi
    ```
    Where `${var+x}` is a [parameter expansion](http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_02) which evaluates to nothing if var is unset, and substitutes the string x otherwise (so doesn't need quotes because it will either be empty or `x`)
