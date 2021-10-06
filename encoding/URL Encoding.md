# URL Encoding

## bash

Using `jq`: ([SO])(https://stackoverflow.com/a/34407620/125246)
```bash
function uri_encode() {
  echo -n "$1" | jq -sRr @uri
}
```

Pure bash ([SO](https://stackoverflow.com/a/10660730/125246)):

```bash
rawurlencode() {
  local string="${1}"
  local strlen=${#string}
  local encoded=""
  local pos c o

  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               printf -v o '%%%02x' "'$c"
     esac
     encoded+="${o}"
  done
  echo "${encoded}"    # You can either set a return variable (FASTER) 
  REPLY="${encoded}"   #+or echo the result (EASIER)... or both... :p
}

easier:  echo http://url/q?=$( rawurlencode "$args" )
faster:  rawurlencode "$args"; echo http://url/q?${REPLY}

# Returns a string in which the sequences with percent (%) signs followed by
# two hex digits have been replaced with literal characters.
rawurldecode() {

  # This is perhaps a risky gambit, but since all escape characters must be
  # encoded, we can replace %NN with \xNN and pass the lot to printf -b, which
  # will decode hex for us

  printf -v REPLY '%b' "${1//%/\\x}" # You can either set a return variable (FASTER)

  echo "${REPLY}"  #+or echo the result (EASIER)... or both... :p
}
```