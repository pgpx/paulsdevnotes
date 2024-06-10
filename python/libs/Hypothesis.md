# Hypothesis

> Hypothesis is a family of testing libraries which let you write tests parametrized by a source of examples.

Property-based testing.

* [Docs](https://hypothesis.readthedocs.io/), [GitHub](https://github.com/HypothesisWorks/hypothesis)

# Pytest and Mock

Hypothesise runs fixtures only once, so mocks and mutable data should be setup within the test method, e.g. setup mocks within the test method instead of as fixtures:

```python
@given(message=st.text())
def test_chat(messages: str) -> None:
    with patch.object(mypackage, "MyClass", autospec=True) as mock_my_class:
        mock_client = mock_my_class.return_value
```

# Strategies

Use [core strategies](https://hypothesis.readthedocs.io/en/latest/data.html#core-strategies) to generate parameters:

```python
from hypothesis import given, strategies as st

@given(
    message=st.list(st.text(min_size=1, max_size=10)),
    system_prompt=st.one_of(
        st.none(), st.sampled_from(["test-prompt"])
    ),
)
def my_test(message: list[str], system_prompt: str | None) -> None:
```

# [Mapping](https://hypothesis.readthedocs.io/en/latest/data.html#mapping)

Use `flatmap` to chain strategies together:

```python
messages=st.sampled_from([1, 10]).flatmap(
    lambda l: st.lists(
        st.fixed_dictionaries(
            {
                "role": st.sampled_from(["assistant", "user"]),
                "content": st.sampled_from(
                    ["test-content"]
                ),
            },
        ),
        min_size=l,
        max_size=l,
    )
),
```