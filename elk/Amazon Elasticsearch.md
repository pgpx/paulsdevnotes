# Amazon Elasticsearch

* [Docs](https://docs.aws.amazon.com/elasticsearch-service/index.html) - [Developer Guide](https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/)
    * [Best Practices](https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/aes-bp.html)
    * [Sizing Amazon ES Domains](https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/sizing-domains.html)
        * [Choosing the Number of Shards](https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/sizing-domains.html#aes-bp-sharding)
            
            `(Source Data + Room to Grow) * (1 + Indexing Overhead) / Desired Shard Size = Approximate Number of Primary Shards` - target 10-50GiB/shard, allow 10% indexing overhead
    * [How can I improve the indexing performance on my Amazon Elasticsearch Service cluster?](https://aws.amazon.com/premiumsupport/knowledge-center/elasticsearch-indexing-performance/)
            
Articles:

* <http://www.havingatinker.uk/aws-elasticsearch-service-woes.html> - including index templates and reindexing.