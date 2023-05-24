# Elasticsearch

* [Reference](https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html)
* <https://www.elastic.co/guide/en/elasticsearch/reference/6.x/xpack-sql.html>
* Amazon Elasticsearch Service [Developer Guide](https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/)
* OpenDistro [home](https://opendistro.github.io/), [docs](https://opendistro.github.io/for-elasticsearch-docs/)

Interesting articles:
* [Elasticsearch from the Top Down](https://www.elastic.co/blog/found-elasticsearch-top-down) - how it is implemented.
* [Lucene's FuzzyQuery is 100 times faster in 4.0](http://blog.mikemccandless.com/2011/03/lucenes-fuzzyquery-is-100-times-faster.html) - edit-distance.
* [Elasticsearch in Production](https://www.elastic.co/blog/found-elasticsearch-in-production)
* [Elasticsearch as a Time Series Data Store](https://www.elastic.co/blog/elasticsearch-as-a-time-series-data-store)
* <https://thoughts.t37.net/designing-the-perfect-elasticsearch-cluster-the-almost-definitive-guide-e614eabc1a87>

## Optimising

* [Tune for disk usage](https://www.elastic.co/guide/en/elasticsearch/reference/master/tune-for-disk-usage.html]
    * [Reindex API](https://www.elastic.co/guide/en/elasticsearch/reference/current/docs-reindex.html)
* [Tune for search speed](https://www.elastic.co/guide/en/elasticsearch/reference/master/tune-for-search-speed.html)
    * [Index Sorting](https://www.elastic.co/guide/en/elasticsearch/reference/master/index-modules-index-sorting.html) ([blog](https://www.elastic.co/blog/index-sorting-elasticsearch-6-0))

## Availability

* <https://aws.amazon.com/blogs/database/increase-availability-for-amazon-elasticsearch-service-by-deploying-in-three-availability-zones-2/>

## Shard size and related articles

* <https://aws.amazon.com/blogs/database/get-started-with-amazon-elasticsearch-service-t-shirt-size-your-domain/>
    * Suggest maximum shard size of 50GB, 25 shards per GB of RAM allocated to the Node's JVM.
    * Also [ref](https://www.elastic.co/guide/en/elasticsearch/reference/current/size-your-shards.html#shard-size-recommendation) suggests 20 shards/GB RAM and shard sizes 10GB to 50GB.
* [Calculating Storage Requirements](https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/sizing-domains.html#aes-bp-storage)
* [Reducing cost for small Amazon Elasticsearch Service domains](https://aws.amazon.com/blogs/database/reducing-cost-for-small-amazon-elasticsearch-service-domains/)
* <https://www.elastic.co/blog/how-many-shards-should-i-have-in-my-elasticsearch-cluster>
* <https://www.elastic.co/guide/en/elasticsearch/reference/7.x/scalability.html>


Primary/replica shards are allocated on different k8s nodes by default - in `elasticsearch.yml`:

```yaml
cluster:
  routing:
    allocation:
      awareness:
        attributes: k8s_node_name
```

* <https://opster.com/guides/elasticsearch/high-availability/elasticsearch-zone-awareness/>
* <https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-cluster.html#shard-allocation-awareness>

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

## Issues

* <https://dev.sobeslavsky.net/kibana-how-to-solve-mapping-conflict/>