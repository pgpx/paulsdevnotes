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

* Set a default value ([SO](https://stackoverflow.com/a/2013589/125246):

    ```bash
    FOO=${VARIABLE:-default}  # If variable not set or null, use default.
    ```
    
    Or, which will assign default to VARIABLE as well:
    
    ```bash
    FOO=${VARIABLE:=default}  # If variable not set or null, set it to default.
    ```
  
## Bash Arrays

* [You don't know Bash: An introduction to Bash arrays](https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays)
  
```shell script
allThreads=(1 2 4 8 16 32 64 128)
for t in ${allThreads[@]}; do
  ./pipeline --threads ${allThreads[$i]}
done
```
  