# Elasticsearch Index Templates

* [Index templates](https://www.elastic.co/guide/en/elasticsearch/reference/current/index-templates.html)
* [PUT index template API (latest)](https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-put-template.html)
* [PUT index template API (7.7)](https://www.elastic.co/guide/en/elasticsearch/reference/7.7/indices-templates.html)
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


## Key properties

* `priority` - higher values override templates with lower values.
* `order` - user-generated version number  - templates with lower `order` values are merged first.
** `priority` in latest version of the [API](https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-put-template.html)
* aliases
* mappings
* [settings](https://www.elastic.co/guide/en/elasticsearch/reference/current/index-modules.html#index-modules-settings)

Settings can be static (creation time) or dynamic (can be changed later).

Static settings include:
* `number_of_shards`

Dynamic settings include:
* `number_of_replicas`
* `refresh_interval` - default `1s` - how often new entries are made available to search.  Setting to `-1` temporarily turns off refreshes until the next searh.
** <https://sematext.com/blog//elasticsearch-refresh-interval-vs-indexing-performance/> - refreshing is relatively expensive, so increasing the value gives greater indexing performance.
** <https://qbox.io/blog/maximize-guide-elasticsearch-indexing-performance-part-2>
