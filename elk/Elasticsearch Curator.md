# Elasticsearch Curator

Cleanup old indices based on rules.

* [CLI](https://www.elastic.co/guide/en/elasticsearch/client/curator/current/cli.html)
* DockerHub [bitnami/elasticsearch-curator](https://hub.docker.com/r/bitnami/elasticsearch-curator)

Notes:
* [period](https://www.elastic.co/guide/en/elasticsearch/client/curator/current/filtertype_period.html) filter can match on actual months, whereas [age](https://www.elastic.co/guide/en/elasticsearch/client/curator/current/filtertype_age.html) filter assumes a 30-day month.
* `source `[timestring](https://www.elastic.co/guide/en/elasticsearch/client/curator/current/fe_timestring.html)