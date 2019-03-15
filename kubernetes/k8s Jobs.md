# k8s Jobs

* Ref: [Writing a Job Spec](https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/#writing-a-job-spec)

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: refresh-job
spec:
  backoffLimit: 0
  template:
    metadata:
      creationTimestamp: null
    spec:
      containers:
        - image: busybox:latest
          name: refresh-job
          command: ["wget", "-O-", "http://app-admin:8080/admin/refresh"]
      restartPolicy: Never
```

Can only wait for successful completion (failure will cause a timeout):

```yaml
kubectl -n "${NAMESPACE}" wait --for=condition=complete job/refresh-job --timeout=15
```

Can call `kubectl logs <job>` to look at the output of the job, and `kubectl delete <job>` to delete it once complete.