# Helm templating

* [The Chart Template Developer's Guide](https://helm.sh/docs/chart_template_guide/)


Values are applied to each file in `templates/`.

## Functions

* [Template Function List](https://helm.sh/docs/chart_template_guide/function_list/)

### b64enc

Base64-encode a value: `{{ b64enc "hello" }}` and `{{ $.Values.myval | b64enc }}`

### range

```kubernetes helm
{{- range $repo := $.Values.repositoryTemplates }}
name: {{ required "name" $repo.name }}
type: {{ b64enc "git" }}
password: {{ required "password" $repo.password | b64enc }}
{{- end }}
```
