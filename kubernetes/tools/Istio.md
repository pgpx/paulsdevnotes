# Istio

* <https://istio.io/>
* [Kiali](https://kiali.io/) - Service mesh management for Istio

## Debugging

* [Debugging Envoy and Istiod](https://istio.io/latest/docs/ops/diagnostic-tools/proxy-cmd/)

## CRDs

* [Gateway](https://istio.io/latest/docs/reference/config/networking/gateway/)

## Istio Operator

* [code](https://github.com/istio/istio/tree/master/operator)
* [install](https://istio.io/latest/docs/setup/install/operator/)

## Issues

### Have to set `safe-to-evict` to allow autoscaler to scale down a node 

* [autoscaler issue #3947](https://github.com/kubernetes/autoscaler/issues/3947)
  * also see [istio issue #19395](https://github.com/istio/istio/issues/19395))

Right now if you have a sidecar like istio's (istio/istio#19395) with an EmptyDir and the main service without it; the pod is excluded. A work around is to set the annotation

```yaml
cluster-autoscaler.kubernetes.io/safe-to-evict: "true"
```

but that applies at the whole pod level and one would need to duplicate the logic checking for volumes to decide true/false.

### Sidecar container doesn't stop after (cron)job finishes

It is actually a general k8s issue about sidecars not stopping after jobs finish ([k8s issue](https://github.com/kubernetes/kubernetes/issues/25908)).

Current solution is to hack something like the following ([Istio issue](https://github.com/istio/istio/issues/6324#issuecomment-760156652) or to just disable Istio for (cron)jobs (also see [Istio issue 11045](https://github.com/istio/istio/issues/11045):

```yaml
- command:
  - /bin/sh
  - -c
  - |
    until curl -fsI http://localhost:15021/healthz/ready; do echo \"Waiting for Sidecar...\"; sleep 3; done;
    echo \"Sidecar available. Running the command...\";
    <YOUR_COMMAND>;
    x=$(echo $?); curl -fsI -X POST http://localhost:15020/quitquitquit && exit $x
```