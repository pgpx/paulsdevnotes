# Kibana

## Query langauge

* <https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-query-string-query.html#query-string-syntax>

```
not entryUrl: "/redirect" AND eventType: "purchase" AND _exists_: recommendedPass
```

* `_exists_: my-field` - does the field have a non-null value