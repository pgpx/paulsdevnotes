# Go Reflection

* <https://pkg.go.dev/reflect>

Does an can a value be cast to another?

```go
if castValue, ok := myVal.(my.Interface); if !ok { /*/return error */ }
```

Get a struct's field value by name and value's interface type ([SO](https://stackoverflow.com/questions/18926303/iterate-through-the-fields-of-a-struct-in-go) and [SO](https://stackoverflow.com/a/50098755/125246)):

```go
// Use Indirect in case the value is a pointer - still works if not
field := reflect.Indirect(reflect.ValueOf(myValue)).FieldByName("Arn")
if !field.IsValid() { /* typically missing vield or nil pointer */ }
value, ok := field.Interface().(pulumi.Int); if !ok { /* invalid value */ }
```