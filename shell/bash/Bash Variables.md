# Bash Variables

Default values: [ref](https://www.cyberciti.biz/tips/bash-shell-parameter-substitution-2.html)

```bash
# Don't change the variable, but return the default if not set
var=${parameter:-defaultValue}

# e.g. if $1 is not set or passed
arg1=${1:-myDefaultValue}

# Update the variable (doesn't work with positional arguments like $1)
${var:=defaultValue}
```

Exit with error if missing a value: ([ref](https://www.cyberciti.biz/tips/bash-shell-parameter-substitution-2.html))

```bash
${varName?Error varName is not defined}
${varName:?Error varName is not defined or is empty}
${1:?"Missing operand"}
```

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
  