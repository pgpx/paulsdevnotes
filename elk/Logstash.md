# Logstash

* [User Guide/Reference](https://www.elastic.co/guide/en/logstash/current/index.html)

* Logback plugin: <https://github.com/logstash/logstash-logback-encoder>

* Slow to start: <https://github.com/elastic/logstash/issues/5507>

Articles:

* <https://sematext.com/blog/logstash-alternatives/> - Logagent, Fileeat, rsyslog, syslog-ng, Fluentd, Apache Flume, Splunk, Graylog

## [Filter Plugins](https://www.elastic.co/guide/en/logstash/current/filter-plugins.html)

## Testing Logstash pipeline config

* <https://logz.io/blog/debug-logstash/>

```bash
sudo bin/logstash --config.test_and_exit -f <path_to_config_file>
```

## Rate limiting events

Use the `throttle` filter and `drop` other events (don't get count of dropped events though) ([issue](https://github.com/elastic/logstash/issues/4726#issuecomment-370926654)):

```logstash
# Add if clause if you only want to throttle based on some condition

# Throttle
throttle {
  # How many events to let through, i.e. 10 events per minute here
  after_count => 10
  period => 60
  # How long to keep timeslots in memory for late arriving data. Prefer AT LEAST double the value of "period"
  max_age => 1800
  # How to group messages, i.e. how to identify same types of messages to throttle
  # Use static string to throttle all events, as is shown here
  key => "-" # use e.g. "%{message}" to group by message
  add_tag => "throttle_drop"
}
if "throttle_drop" in [tags] {
  drop { }
}
``` 