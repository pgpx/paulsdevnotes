# Kyverno Cluster Policy

Legacy policy type.

## Selecting Resources

* [Ref](https://kyverno.io/docs/policy-types/cluster-policy/match-exclude/)

```
match (and exclude):
  any (and all):
    resources:
      kinds: Group/Version/Kind (e.g. networking.k8s.io/v1/NetworkPolicy), supports * wildcards]
            Also subresource, e.g. Pods/status or Pods.status
      names:
      namespaces:
      operations: [CREATE, UPDATE]
      selector:
        matchLabels:
            key: value (both can have * and ?)
        matchExpressions:
        - key: namespacekind
          operator: NotIn
          values:
          - platform
      namespaceSelector:
        matchLabels: ...
        matchExpressions: ...
        
    subjects: users, user groups, and service accounts
      roles: namespaced roles
      clusterRoles: cluster-wide roles
```

## [Validate Rules](https://kyverno.io/docs/policy-types/cluster-policy/validate/)

```yaml
apiVersion: kyverno.io/v1
# The `ClusterPolicy` kind applies to the entire cluster.
kind: ClusterPolicy
metadata:
  name: require-ns-purpose-label
# The `spec` defines properties of the policy.
spec:
  emitWarnings: true # set to show audit policy violation in admission response warnings
  # The `rules` is one or more rules which must be true.
  rules:
  - name: require-ns-purpose-label
    # The `match` statement sets the scope of what will be checked. In this case, it is any `Namespace` resource.
    match: ...
    # The `validate` statement tries to positively check what is defined. If the statement, when compared with the requested resource, is true, it is allowed. If false, it is blocked.
    validate:
      # The `failureAction` tells Kyverno if the resource being validated should be allowed but reported (`Audit`) or blocked (`Enforce`).
      failureAction: Enforce
      failureActionOverrides: # specify action per namespace
        - action: Enforce
          namespaces: [ ... ]
      # The `message` is what gets displayed to a user if this rule fails validation.
      message: "You must have label `purpose` with value `production` set on all new namespaces."
      # The `pattern` object defines what pattern will be checked in the resource. In this case, it is looking for `metadata.labels` with `purpose=production`.
      allowExistingViolations: false # updates to pre-existing will be blocked if Enforce
      pattern:
        metadata:
          labels:
            purpose: production
      anyPattern: # pass if any of the patterns match (e.g. if content at different levels)
        - spec: ...
      deny:
        conitions:
          any:
            - ...
      # 
```

[Operators](https://kyverno.io/docs/policy-types/cluster-policy/validate/#operators):

* Strings:
  * `*` - 0 or more chars (but non-null), `?` single char, `?*` 1 or more
  * `null` or `""` requires field not defined or no value
* Numerics: `>=2`, `!` not equals, `|` or, `&` and, `1-5` within a range  (inclusive), `a!-b` outside a range

[Anchors](https://kyverno.io/docs/policy-types/cluster-policy/validate/#operators):

* `(image): "*:latest"` - conditional - if tag with given value (incl. child elements), then peer elementts will be processed.
* `=(hostPath):` - equality - if tag is specified (then processing continues).
* `^(containers)` - existence - if at least one element in the list satisfies the pattern (instead of all elements for a `()` conditional)
* `X(hostPath): "null` - negation - tag cannot be specified (value is not used and so should always be `"null"` incl. quotes)
* `<(image): "corp.reg.com/*"` global - if matched will cause entire rule to be skipped.

...