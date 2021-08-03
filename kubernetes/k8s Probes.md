# k8s Probes

* [Configure Liveness, Readiness and Startup Probes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)
  > The kubelet uses liveness probes to know when to restart a container. For example, liveness probes could catch a deadlock, where an application is running, but unable to make progress. Restarting a container in such a state can help to make the application more available despite bugs.
  > 
  > The kubelet uses readiness probes to know when a container is ready to start accepting traffic. A Pod is considered ready when all of its containers are ready. One use of this signal is to control which Pods are used as backends for Services. When a Pod is not ready, it is removed from Service load balancers.
  > 
  > The kubelet uses startup probes to know when a container application has started. If such a probe is configured, it disables liveness and readiness checks until it succeeds, making sure those probes don't interfere with the application startup. This can be used to adopt liveness checks on slow starting containers, avoiding them getting killed by the kubelet before they are up and running.

* Problems: (e.g. missing host) ([SO](https://stackoverflow.com/questions/49770036/kubernetes-probes-fail-on-tomcat))
* Liveness and readiness: Blog: [Utilizing Kubernetes Liveness and Readiness Probes to Automatically Recover From Failure](https://medium.com/spire-labs/utilizing-kubernetes-liveness-and-readiness-probes-to-automatically-recover-from-failure-2fe0314f2b2e)
    * Should dependencies be tested? [Comment](https://medium.com/@andyhume/this-is-really-interesting-thanks-cc4122529382)
