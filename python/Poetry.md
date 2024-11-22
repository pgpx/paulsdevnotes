# Poetry

Python packaging and dependency management made easy

* <https://python-poetry.org/>

## CLI

Update dependencies and check what will be installed:

```bash
rm -f poetry.lock && poetry lock --no-update && poetry install --no-root && poetry show -a
```

Show outdated top-level dependencies:

```bash
poetry show -oT  # --outdated --top-level
```

## [Explicit Package Sources](https://python-poetry.org/docs/repositories#explicit-package-sources)

From <https://stackoverflow.com/a/76359919/125246>:

```bash
poetry source add -p explicit pytorch https://download.pytorch.org/whl/cu121
```

```toml
[[tool.poetry.source]]
name = "pytorch"
url = "https://download.pytorch.org/whl/cu121"
priority = "explicit"
```

```bash
poetry add --source pytorch torch
```

```toml
[tool.poetry.dependencies]
torch = { version = "^2.1.0", source = "pytorch" }
```

Install dependencies and remove those that are no longer needed (from `site-packages`) ([SO](https://stackoverflow.com/a/74982440/125246)) 
```bash
poetry install --sync
```