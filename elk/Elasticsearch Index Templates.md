# Elasticsearch Index Templates

* [Index templates](https://www.elastic.co/guide/en/elasticsearch/reference/current/index-templates.html)
* [Mapping](https://www.elastic.co/guide/en/elasticsearch/reference/current/mapping.html)
* Data types: [keyword](https://www.elastic.co/guide/en/elasticsearch/reference/current/keyword.html), [flattened](https://www.elastic.co/guide/en/elasticsearch/reference/current/flattened.html) (X-Pack only!)

Also:

* [Dynamic templates](https://www.elastic.co/guide/en/elasticsearch/reference/current/dynamic-templates.html)

```
GET _template

GET _template/my_template
```

Get mapping definitions for one or more indices ([ref](https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-get-mapping.html):

```
GET /my-index-000001/_mapping
```