# Kibana

## Query langauge

* <https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-query-string-query.html#query-string-syntax>
* Kibana uses the [Lucene Query Parser Syntax](https://lucene.apache.org/core/2_9_4/queryparsersyntax.html)


```
not entryUrl: "/redirect" AND eventType: "purchase" AND _exists_: recommendedPass
```

* `_exists_: my-field` - does the field have a non-null value
* `NOT myField: ("value-1" OR "value-2")` - does a field (not) have one of the specified values ([ref](https://discuss.elastic.co/t/filtering-for-multiple-values-of-a-single-field/97584))