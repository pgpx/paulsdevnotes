# Logstash Plugins

## [Filter plugins](https://www.elastic.co/guide/en/logstash/current/filter-plugins.html)

* [Metricize](https://www.elastic.co/guide/en/logstash/current/plugins-filters-metricize.html)
* [Translate](https://www.elastic.co/guide/en/logstash/current/plugins-filters-translate.html)

## json_encode

Save a nested object/value as a JSON string (leaves the original alone)

```yaml
json_encode {
    source => "requestHeaders"
    target => "requestHeadersJson"
}
```