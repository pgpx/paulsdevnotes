# ElasticSearch Queries

* <https://www.elastic.co/guide/en/elasticsearch/reference/7.7/compound-queries.html>

## [Moving Average Aggregations](https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-pipeline-movavg-aggregation.html)

```
GET _cat/allocation?v&s=node
GET /_cluster/allocation/explain
GET /_cluster/health?pretty
GET _cat/shards?v&s=store
GET _cat/shards?v&s=state,index
GET _cat/shards?h=index,shard,prirep,state,unassigned.reason&s=state,index
GET _cluster/allocation/explain?pretty
GET _cat/indices?v
```