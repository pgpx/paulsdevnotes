# Go Maps

* <https://go.dev/blog/maps>

* Key types must be comparable ([spec](https://go.dev/ref/spec#Comparison_operators))
* 
```go
var m map[string]int
m = make(map[string]int)
m["route"] = 66
delete(m, "route")

// Get key
value, ok := m["route"]

// Init
commits := map[string]int{
    "rsc": 3711,
    "r":   2138,
    "gri": 1908,
    "adg": 912,
}

// Cna use the zero value of values to simplify existance tests:
visited := make(map[*Node]bool)
if visited[n] {
```