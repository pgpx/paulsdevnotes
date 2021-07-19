# Git native implementations

## Python - Dulwich

* [GitHub](https://github.com/dulwich/dulwich),
  [API](https://www.dulwich.io/docs/api/)

Aims to provide an interface to git repos (both local and remote) that doesn't call out to git directly but instead uses pure Python.

Get all tags: ([SO](https://stackoverflow.com/a/16639853/125246))

```python
from dulwich.repo import Repo
r = Repo("/path/to/repo")
tags = r.refs.as_dict("refs/tags")
```

## Go - go-git

* <https://github.com/go-git/go-git>