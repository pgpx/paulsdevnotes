# Hex encoding

Pairs of `[0-9a-f]` for each byte of binary input.

## bash

([SO](https://stackoverflow.com/a/49903434/125246))

```bash
function to_hex() {  
  echo -n "$1" | xxd -ps -c 200 | tr -d '\n'
}

function from_hex() {
  echo -n "$1" | xxd -r -p
}
```