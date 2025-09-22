# Kyverno Generating

* Cannot use a secret in the kyverno namespace for a clone source, because they are excluded by
  `config.resourceFilters` (in the Helm char / ConfigMap)