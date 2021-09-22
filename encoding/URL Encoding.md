# URL Encoding

## bash

([SO])()
```bash
function uri_encode() {
  echo -n "$1" | jq -sRr @uri
}
```