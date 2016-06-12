# Coursera [Functional Programming Principles in Scala](https://www.coursera.org/learn/progfun1/home/welcome)

* [Wiki](https://github.com/lampepfl/progfun-wiki)
* [Cheat Sheet](https://github.com/lampepfl/progfun-wiki/blob/gh-pages/CheatSheet.md)

## Week 1

Imperative programming: modifying mutable variables, assignmets, control structures, Von Neumann architecture.

Want higher-level abstractions and be able to reason about them:

Theory - 1 or more data types, operations on them, laws that describe the relationships between values and operations.  Does not describe mutations (change something while keeping its identity the same)

So: want functions (theories), no place for mutation, powerful ways to abstract and compose functions (what we gain by losing mutation)

* Restricted view of Functional Programming: no mutable, loops, imperative control structures.
* More general: focusing on the functions (particularly functions can be values that are produced, consumed, composed)

*Structure and Interpretation of Computer Programs. Abelson and Sussman* [MIT ebook](https://mitpress.mit.edu/sicp/)

Evaluation of function applications (substitution model - evaluation _reduces an expression to a value_, formalised in lambda-calculus - cannot be applied if expressions have side effects):

1. Evaluate all function args left to right
2. Replace function application by function's right-hand side and at the same time replace formal parameters of the function by the actual arguments.
