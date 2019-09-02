# Grafana

# [Annotations](http://docs.grafana.org/features/datasources/graphite/#annotations)


## Docker images

* [frontporch/docker-grafana](https://hub.docker.com/r/frontporch/docker-grafana/) - Grafana container that will wait for it to load and then load custom dashboards
* <http://simonjbeaumont.com/posts/docker-dashboard/> - how to configure Docker with InfluxDB

## Plugins

* [Grafana Meta Queries](https://github.com/GoshPosh/grafana-meta-queries) - used in conjunction with another datasource to show computed metrics.

## Issues

Alerts only work with built-in plugins: [issue](https://github.com/gbrian/grafana-timelion-datasource/issues/14)