# Kibana Timelion

```
.es('eventType:purchase AND passProvider:NEXUS').movingaverage(10m).holt(0.9,0.1,0.9,season=24h).subtract(.es('eventType:purchase AND passProvider:NEXUS').movingaverage(10m)), .es('eventType:purchase AND passProvider:NEXUS').movingaverage(10m),.es('eventType:purchase AND passProvider:NEXUS').movingaverage(10m).holt(0.9,0.1,0.9,season=24h)
```