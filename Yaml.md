# Yaml

* <https://learnxinyminutes.com/docs/yaml/>

## Multiple-line strings ([SO](https://stackoverflow.com/a/21699210/125246))

* <https://yaml-multiline.info>

If a normal string is split across multiple lines then the newlines will be by default removed:

```yaml
script:
    - Long string
      on multiple lines
```

To keep the newlines add '|'

```yaml
script:
    - |
      Long string
      on multiple lines
```