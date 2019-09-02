# Elasticsearch

* [Reference](https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html)
* <https://www.elastic.co/guide/en/elasticsearch/reference/6.x/xpack-sql.html>

Interesting articles:
* [Elasticsearch from the Top Down](https://www.elastic.co/blog/found-elasticsearch-top-down) - how it is implemented.
* [Lucene's FuzzyQuery is 100 times faster in 4.0](http://blog.mikemccandless.com/2011/03/lucenes-fuzzyquery-is-100-times-faster.html) - edit-distance.
* [Elasticsearch in Production](https://www.elastic.co/blog/found-elasticsearch-in-production)

## Querying

* [Elasticsearch/Kibana Queries - In Depth Tutorial](https://www.timroes.de/2016/05/29/elasticsearch-kibana-queries-in-depth-tutorial/)

Match any terms in a list ([SO](https://stackoverflow.com/questions/50473420/lucene-query-for-array-and-in-all-in-any-in-operations)):



```
# Match any of the query terms (in a list):
optionIds:(72 11 9)

# Match all of the query terms:
optionIds:(+72 +11 +9)
```

* Wildcard querying issues: <https://discuss.elastic.co/t/wildcard-query-not-working-as-expected/84447/2>