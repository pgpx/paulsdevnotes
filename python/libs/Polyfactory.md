# Polyfactory

> Polyfactory is a simple and powerful mock data generation library, based around type hints and supporting dataclasses, typed-dicts, pydantic models, msgspec structs and more.

* [Homepage](https://polyfactory.litestar.dev/), [GitHub](https://github.com/litestar-org/polyfactory), [Usage Guide](https://polyfactory.litestar.dev/latest/usage/index.html), [API](https://polyfactory.litestar.dev/latest/reference/index.html)

# Pydantic

```python
class MyClassFactoryFactory(ModelFactory[MyClass]):
    __randomize_collection_length__ = True
    __min_collection_length__ = 1
    __max_collection_length__ = 5

```

# TypedDict

```python
class ChatAssistantMessageFactory(TypedDictFactory[ChatAssistantMessage]):
    __faker__ = Faker(locale="de_DE")
    __set_as_default_factory_for_type__ = True

    @classmethod
    def content(cls) -> str:
        return cls.__faker__.text()
```

* Can't generate union types, such as `ChatMessage = Union[ChatAssistantMessage, ChatUserMessage]`, though can generate them as members, e.g.

```python
class ChatList(typing.TypedDict):
    messages: list[ChatAssistantMessage | ChatUserMessage]
```