# Keycloak

* <https://www.keycloak.org>

* [Docs](https://www.keycloak.org/docs/)
* [Release Notes](https://www.keycloak.org/docs/latest/release_notes/index.html)

* [Securing Applications and Services Guide](https://www.keycloak.org/docs/latest/securing_apps/)
* [Server Administration Guide](https://www.keycloak.org/docs/latest/server_admin/)

Misc
* [Codecentric Helm chart](https://github.com/codecentric/helm-charts/blob/master/charts/keycloak/README.md#providing-a-custom-theme)
* [Awesome Keycloak](https://github.com/thomasdarimont/awesome-keycloak) - Carefully curated list of awesome Keycloak resources.

## Keycloak Operator

* [Docs](https://www.keycloak.org/docs/latest/server_installation/#_operator), [GitHub](https://github.com/keycloak/keycloak-operator), [GitHub CRD schemas](https://github.com/keycloak/keycloak-operator/tree/master/deploy/crds), [operatorhub.io](https://operatorhub.io/operator/keycloak-operator)

Articles:
* [Keycloak Operator: Running Locally With Kind](https://www.coveros.com/keycloak-operator-running-locally-with-kind/)

## Roles

### [Role Scope Mappings](https://www.keycloak.org/docs/latest/server_admin/index.html#_role_scope_mappings)

> Role Scope Mappings limit the roles declared inside an access token. When a client requests a user authentication, the access token they receive contains only the role mappings that are explicitly specified for the client’s scope. The result is that you limit the permissions of each individual access token instead of giving the client access to all the users permissions.

## Resource servers

* Any client application can be configured to support fine-grained permissions. In doing so, you are conceptually turning the client application into a resource server ([ref](https://www.keycloak.org/docs/latest/authorization_services/index.html#_resource_server_overview)).