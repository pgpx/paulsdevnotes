# ScalaTest

* <http://www.scalatest.org/>

## Syntax

```scala
@RunWith(classOf[JUnitRunner]) class ListsSuite extends FunSuite {
```

Simple test

```scala
test("test name")(assert(1 + 2 === 3))
test("test name") { assert(1 + 2 === 3) }
```

Use `===` (ScalaTest's special equality operator) to output the reason for a failure.

Expected exceptions with `intercept`

```scala
test("intNotZero throws an exception if its argument is 0") {
    intercept[IllegalArgumentException] {
      intNotZero(0)
    }
  }
```
