# Base64

* [Base 64 Encoding RFC](https://datatracker.ietf.org/doc/html/rfc4648#section-4)
* [Base 64 Encoding with URL and Filename Safe Alphabet](https://datatracker.ietf.org/doc/html/rfc4648#section-5) - `-` and `_` instead of `+` and `/`

* Valid characters: `A-Za-z0-9+/` and `=` for padding
* Padding: encoding is performed in 24 input bit chunks mapped to 4 output characters, so if fewer than 4 are needed at the end, fill remainder with `=`)

## Shell: Base64-encode a string (without a trailing newline!):

```bash
echo -n "test-string" | base64
```

## Bash: Convert to URL/Filename-safe encoding

```bash
encoded=$(echo -n "test-string" | base64)
encoded=${encoded//\//_}
encoded=${encoded//\+/-}
```