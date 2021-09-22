# SHA

## Bash HMAC SHA-256

```bash
# Hex-encoded key, create digest of input_file file (with `=` padding)
key=943b421c9eb07c830a123456552c86009268de4e532ba2ee2eab8247c6da1234
digest=$(openssl dgst -sha256 -mac HMAC -macopt "hexkey:${key}" -binary input_file | base64)
```

## Java HMAC SHA-256

* <https://www.javacodemonk.com/create-hmacsha256-signature-in-java-3421c36d>
* <https://automationrhapsody.com/md5-sha-1-sha-256-sha-512-speed-performance/>