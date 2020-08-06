# k8s CronJob

* Ref: [Automated tasks with cron jobs](https://kubernetes.io/docs/tasks/job/automated-tasks-with-cron-jobs/)
* [Concepts](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/)
* [API ref](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.18/#cronjob-v1beta1-batch)

CronJob timezone is that of the kube-controller-manager ([concepts](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/)), and can't be specified otherwise.
* [Cronjobber](https://github.com/hiddeco/cronjobber) is the cronjob controller from Kubernetes patched with time zone support.

Test a CronJob by manually creating a Job from it that will run immediately:
* <https://www.craftypenguins.net/how-to-trigger-a-kubernetes-cronjob-manually/>>

```bash
kubectl -n mynamespace create job --from=cronjob/mycronjob newjobname
```