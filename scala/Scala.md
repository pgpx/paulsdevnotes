# Scala

* <http://www.scala-lang.org/>
* [sbt](http://www.scala-sbt.org/index.html) - Scala Build Tool
* Twitter's [Scala School](http://twitter.github.io/scala_school/)
* Coursera [Functional Programming Principles in Scala](https://www.coursera.org/learn/progfun1/home/welcome)
* [scalaenv](https://github.com/mazgi/scalaenv) - control the Scala version
* [sbtenv](https://github.com/mazgi/sbtenv) - control the sbt version

## Coursera [Functional Programming Principles in Scala](https://www.coursera.org/learn/progfun1/home/welcome)

* [Wiki](https://github.com/lampepfl/progfun-wiki)
* [Cheat Sheet](https://github.com/lampepfl/progfun-wiki/blob/gh-pages/CheatSheet.md)

## sbt

* `run` - run an `App`

## ScalaTest

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
