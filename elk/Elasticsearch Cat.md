# Elasticsearch Cat

Human-readable APIs

* <https://www.elastic.co/guide/en/elasticsearch/reference/current/cat.html>

Useful queries:

```
GET /_cluster/health?pretty
GET _cluster/allocation/explain

# Index templates
GET _template/ebdc

# Node allocation
GET _cat/allocation?v&s=node

# Node status
GET _cat/nodes?v

# Index sizes
GET _cat/indices?v&s=index
GET _cat/indices/?v&s=index&index=ebdc-ee-prod-*

# Index segments
GET my-index/_segments

# Index templates
GET _template/
GET _cat/templates

# Shards
GET _cat/shards/?v

# Tasks
GET _tasks?detailed
GET _tasks?actions=*reindex&detailed

# Get and delete a task
GET _tasks/my-task-id:43153473
POST _tasks/my-task-id/_cancel

# Snapshot status
GET _snapshot/_status
```