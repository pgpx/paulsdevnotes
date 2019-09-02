# Logstash Pipeline Configuration

Ref:
* [Accessing Event Data and Fields in the Configuration](https://www.elastic.co/guide/en/logstash/current/event-dependent-configuration.html)
* [Filter plugins](https://www.elastic.co/guide/en/logstash/current/filter-plugins.html)

## Conditionals


Regex ([SO](https://stackoverflow.com/a/39031235/125246))

```logstash
if [URI] =~ /restAPI\/callMethod1/ {
```

```
message:"henry-ee" AND eventType:purchase AND _exists_:paymentInfo
```