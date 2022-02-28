# k8s Labels

* [Recommended Labels](https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/)

| Key                            | Description                                                                            | Example              | Type   |
|--------------------------------|----------------------------------------------------------------------------------------|----------------------|--------|
| `app.kubernetes.io/name`       | The name of the application                                                            | `mysql`              | string |
| `app.kubernetes.io/instance`   | A unique name identifying the instance of an application                               | `mysql-abcxzy`       | string |
| `app.kubernetes.io/version`    | The current version of the application (e.g., a semantic version, revision hash, etc.) | `5.7.21`             | string |
| `app.kubernetes.io/component`  | The component within the architecture                                                  | `database`           | string |
| `app.kubernetes.io/part-of`    | The name of a higher level application this one is part of                             | `wordpress`          | string |
| `app.kubernetes.io/managed-by` | The tool being used to manage the operation of an application                          | `helm`               | string |
| `app.kubernetes.io/created-by` | The controller/user who created this resource                                          | `controller-manager` | string |