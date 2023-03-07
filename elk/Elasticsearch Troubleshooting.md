# Elasticsearch Troubleshooting.md

([ref](https://github.com/elastic/elasticsearch/issues/23199#issuecomment-280272888)) - 
After 5 unsuccessful allocation attempts, the master gives up and needs manual triggering to give it another allocation attempt (see <https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-reroute.html#_retry_failed_shards>). To retry run: `curl -XPOST 'localhost:9200/_cluster/reroute?retry_failed`

Run `_cluster/allocation/explain` to determine why the cluster is not green.

`GET /_cluster/health?pretty`