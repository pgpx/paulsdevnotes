# Go Encoding

Encode a string as base64: ([ref](https://pkg.go.dev/encoding/base64))

```go
encoded := base64.StdEncoding.EncodeToString([]byte(msg))
decoded, err := base64.StdEncoding.DecodeString(encoded)
```