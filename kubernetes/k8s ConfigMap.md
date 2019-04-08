# k8s ConfigMap

* [Unofficial docs](https://unofficial-kubernetes.readthedocs.io/en/latest/tasks/configure-pod-container/configmap/)
* [Configure a Pod to Use a ConfigMap](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/)

* [Inject Information into Pods Using a PodPreset](https://kubernetes.io/docs/tasks/inject-data-application/podpreset/)

* Create a ConfigMap from a file:

    ```bash
    kubectl -n myns create configmap config-map-name --from-file my-file
    ```
    
* Mount a ConfigMap as a volume ([SO](https://stackoverflow.com/a/39479928/125246):

    ```yaml
    spec:
      containers:
        - image: ubuntu
          ...
          volumeMounts:
          - mountPath: /mnt/file-from-cfgmap
            name: cfgmap
            subPath: path-in-cfgmap
      volumes:
      - name: cfgmap
        configMap:
          name: cfgmap-name      
    ```
    
Replace a ConfigMap (instead of updating it) so that the previous version isn't stored in the metadata (potentially failing beacause the size is greater than the 1MB allowed by k8s's etcd) ([GitHub discussion](https://github.com/kubernetes/kubernetes/issues/30558)):

```
 kubectl -n "my-namespace" create configmap "my-configmap"  --dry-run -o yaml --from-file=target.filename=source.filename | \
            kubectl replace -f -
```

* This is a [disruptive update](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/#disruptive-updates).
* <https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/#in-place-updates-of-resources>

# Eventually consistent

ConfigMaps are only eventually consistent when mounted as volumes (when not using subpath), which means that if we update a ConfigMap, we'll only see the changes on each Pod's filesystem at some random point in the future!  (See MountedConfigMaps are updated automatically in <https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/#add-configmap-data-to-a-volume> and the last paragraph of <https://medium.com/google-cloud/kubernetes-configmaps-and-secrets-part-2-3dc37111f0dc>).

* Default kubelet sync period:
    ```
    --sync-frequency duration
       Max period between synchronizing running containers and config (default 1m0s)
   ```
* Default TTL: <https://github.com/kubernetes/kubernetes/blob/master/pkg/kubelet/configmap/configmap_manager.go#L108>
* Maybe a fix in: <https://github.com/kubernetes/kubernetes/pull/64752>
* Related issue: <https://github.com/kubernetes/kubernetes/issues/30189>

ConfigMaps used for environment variables are only updated when the Pod is 