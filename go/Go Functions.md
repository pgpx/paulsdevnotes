# Go Functions

Add a value to a variadic arg ([SO](https://stackoverflow.com/a/56839865/125246)):

```go
append(opts, pulumi.Parent(component))...
```