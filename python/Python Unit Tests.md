# Python Unit Tests

* [unittest](https://docs.python.org/3/library/unittest.html#module-unittest) module.
* <https://docs.python-guide.org/writing/tests/>


Assert raises an exception ([SO](https://stackoverflow.com/a/129522/125246)):

```python
self.assertRaises(SomeCoolException, mymod.myfunc)
```

## Table driven unit tests

* ([example](http://love-python.blogspot.com/2017/10/table-driven-unit-test-in-python.html))

Use `subTest`:

```python
def test_gitlab_ci_branch_tag(self):
    test_cases = [
        {
            'name': 'branch if no tag',
            'expected': ('branch-name', None),
            'param': 'branch-name'
        },
        ...
    ]

    for test_case in test_cases:
        with self.subTest(msg=test_case['name']):
            if expected := test_case.get('expected'):
                self.assertEqual(expected, make_call(test_case['param']))
```
