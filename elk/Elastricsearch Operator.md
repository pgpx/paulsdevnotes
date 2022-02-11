# Elasticsearch Operator

* [Elastic Cloud on Kubernetes (ECK)](https://github.com/elastic/cloud-on-k8s)
    > Elastic Cloud on Kubernetes automates the deployment, provisioning, management, and orchestration of Elasticsearch, Kibana, APM Server, Enterprise Search, Beats, Elastic Agent, and Elastic Maps Server on Kubernetes based on the operator pattern.

## Issues with rolling updates

* Operator will safely migrate ES nodes by using a Pod Disruption Budget (usually allowing 1 disruption).  However, if the cluster is not in `green` state, it will allow 0 disruptions, so no migration can proceed (e.g. of underlying k8s nodes).