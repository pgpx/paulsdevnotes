# Prometheus

* Ref: [Query Functions](https://prometheus.io/docs/prometheus/latest/querying/functions/)

* [Using Seasonality in Prometheus alerting](https://medium.com/qubit-engineering/using-seasonality-in-prometheus-alerting-d90e68337a4c)
* [How does a Prometheus Counter work?](https://www.robustperception.io/how-does-a-prometheus-counter-work)
* [How much disk space do Prometheus blocks use?](https://www.robustperception.io/how-much-disk-space-do-prometheus-blocks-use)

# Sub-queries

* <https://www.robustperception.io/how-much-of-the-time-is-my-network-usage-over-a-certain-amount>

```
holt_winters(avg_over_time(ebdc_elk_purchase_rate[5m])[1d:], 0.3, 0.7) - ebdc_elk_purchase_rate
```

```
sum(ebdc_error_rate{eventType='page'}) by (status)
sum(ebdc_elk_metric_latency_seconds_sum) by (metric) / sum(ebdc_elk_metric_latency_seconds_count) by (metric)
```