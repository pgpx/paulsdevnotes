# Go Slices

* [Slices - ref](https://go.dev/ref/spec#Slice_types)
* [Slices - A Tour of Go](https://go.dev/tour/moretypes/7)

> A slice is a descriptor for a contiguous segment of an underlying array and provides access to a numbered sequence of elements from that array. ([ref](https://go.dev/ref/spec#Slice_types))

* `len(s)` <= `cap(s)` - capacity is sum of length-of-slice + length-of-array-beyond-the-slice 
```go
// Produces same slice as allocating an array and slicing it
make([]T, length, capacity)

make([]int, 50, 100)
// Same as allocating an array with new and then slicing it
new([100]int)[0:50]

```

Appending to slices ([ref](https://go.dev/ref/spec#Appending_and_copying_slices)): `append` will append (0 or more) values to a slice, creating a new underlying array if more capacity needed (copying the original array's values).

```go
append(s S, x ...T) S // T is the element type of S
```

Special case appends bytes of a string

```go
var b []byte
b = append(b, "bar"...)            // append string contents      b == []byte{'b', 'a', 'r' }
```

[copy](https://pkg.go.dev/builtin#copy) The copy built-in function copies elements from a source slice into a destination slice. (As a special case, it also will copy bytes from a string to a slice of bytes.) The source and destination may overlap. Copy returns the number of elements copied, which will be the minimum of len(src) and len(dst). (so will truncate)

```go
copy(dst, src []T) int

var a = [...]int{0, 1, 2, 3, 4, 5, 6, 7}
var s = make([]int, 6)]
n1 := copy(s, a[0:])            // n1 == 6, s == []int{0, 1, 2, 3, 4, 5}

var b = make([]byte, 5)
n3 := copy(b, "Hello, World!")  // n3 == 5, b == []byte("Hello")y
```