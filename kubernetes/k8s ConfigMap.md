# k8s ConfigMap

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