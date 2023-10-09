# Istio

* <https://istio.io/>
* [Kiali](https://kiali.io/) - Service mesh management for Istio

Articles 

* [Image signing and validation](https://istio.io/latest/docs/ops/best-practices/image-signing-validation/)
* [Security Best Practices](https://istio.io/latest/docs/ops/best-practices/security/

Istio is built using BoringSSL, which means it does not support TLS 1.0 (and can't be manipulated to use it)

## Configuring the sidecar

Stop Istio capturing inbound traffic (e.g. so that you can access directly via a LoadBalancer service), add the following annotation to the pod/deployment ([ref](https://istio.io/latest/about/faq/traffic-management/#controlling-inbound-ports))

```yaml
traffic.sidecar.istio.io/includeInboundPorts: ""

# And.or outbound:
traffic.sidecar.istio.io/excludeOutboundPorts: "..."
```


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

### [Pod or containers start with network issues if istio-proxy is not ready](https://istio.io/latest/docs/ops/common-problems/injection/#pod-or-containers-start-with-network-issues-if-istio-proxy-is-not-ready)

> Many applications execute commands or checks during startup, which require network connectivity. This can cause application containers to hang or restart if the istio-proxy sidecar container is not ready.
> 
> To avoid this, set holdApplicationUntilProxyStarts to true. This causes the sidecar injector to inject the sidecar at the start of the pod’s container list, and configures it to block the start of all other containers until the proxy is ready.
> 
> This can be added as a global config option:

```yaml
values.global.proxy.holdApplicationUntilProxyStarts: true
```

or as a pod annotation:

```yaml
proxy.istio.io/config: '{ "holdApplicationUntilProxyStarts": true }'
```

### X-Forwarded-For

* <https://kubernetes.io/docs/tutorials/services/source-ip/#source-ip-for-services-with-type-nodeport>
* <https://istio.io/latest/docs/ops/configuration/traffic-management/network-topologies/#configuring-network-topologies>

In Istio IngressGateway Helm:

```yaml
gateway:
  service:
    type: NodePort
    # Preserve source IP, but will require client retries!
    externalTrafficPolicy: "Local"
```

In VirtualServices:

```yaml
  http:
    - match:
        - headers:
            X-Forwarded-For:
              exact: 1.2.3.4
```