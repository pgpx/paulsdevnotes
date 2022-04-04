# Go Filesystem

## embed source files in the compiled output

* `embed` ([ref](https://pkg.go.dev/embed))

Embed one or more files in a string/byte slice/filesystem:

```go
import "embed"

//go:embed hello.txt
var s string
print(s)

//go:embed hello.txt
var b []byte
print(string(b))

//go:embed hello.txt
var f embed.FS
data, _ := f.ReadFile("hello.txt")
print(string(data))
```