# Elasticsearch Indices

* [Tune for indexing speed](https://www.elastic.co/guide/en/elasticsearch/reference/current/tune-for-indexing-speed.html#tune-for-indexing-speed)

Delete an index ([API](https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-delete-index.html):

```sh
curl -X DELETE 'https://elasticsearch-url/my-index-*'
```

You'll still need to delete the index pattern from the Management page.

