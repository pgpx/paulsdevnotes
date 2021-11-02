# Dulwich

Native Git library.

* <https://www.dulwich.io/>
* [Docs](https://www.dulwich.io/docs/index.html), [GitHub](https://github.com/dulwich/dulwich)

## Reading tags

Annotated tags are tag objects pointing to commits, other tags are just the commit directly (from [gitst](https://gist.github.com/mikofski/e923750b415e4e4961b65a8eb42999e8)):

```python
from dulwich.objects import Tag

tag_ref = repo.refs.as_dict(b"refs/tags")['my-tag']
obj = repo.get_object(tag_ref)
if type(obj) == Tag:
    tag = cast(Tag, obj)
    return tag.object[1]
else:
    return obj.id
```
