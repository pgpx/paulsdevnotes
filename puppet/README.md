# Puppet notes

* <https://puppetlabs.com/>
* [Open Source Docs](https://docs.puppetlabs.com/puppet/)
* [Type Ref](https://docs.puppetlabs.com/references/latest/type.html)
* [Language Ref](https://docs.puppetlabs.com/puppet/latest/reference/lang_summary.html)
* [Function Ref](http://docs.puppetlabs.com/references/4.2.latest/function.html)
* [The Puppet Language Style Guide](http://docs.puppetlabs.com/guides/style_guide.html)

## Books / Videos / Websites

* [Learning Puppet (video)](https://www.safaribooksonline.com/library/view/learning-puppet/9781771373487/)
* [Learning Puppet 4](https://www.safaribooksonline.com/library/view/learning-puppet-4/9781491907993/)
* [Puppet Best Practices](https://www.safaribooksonline.com/library/view/puppet-best-practices/9781491922996/)
* [Puppet Cookbook](http://www.puppetcookbook.com/)

## Review later

* <https://puppetlabs.com/blog/refactor-your-monolithic-code-repo-to-deploy-with-r10k>
* <https://github.com/puppetlabs/r10k/blob/master/doc/dynamic-environments/quickstart.mkd>
* <https://puppetlabs.com/webinars/git-workflow-best-practices-deploying-r10k>
* <https://puppetlabs.com/blog/git-workflow-and-puppet-environments>
* <https://docs.puppetlabs.com/pe/latest/r10k_run.html>
* <https://docs.puppetlabs.com/pe/latest/quick_start_r10k.html>
* <http://garylarizza.com/blog/2014/08/31/r10k-plus-directory-environments/>
* <http://rnelson0.com/2015/04/15/improved-r10k-deployment-patterns/>

## Commands

* `puppet`
* `facter`- evaluates a system and provides a number of facts about it (including node-specific information like architecture, hostname, and IP address, in addition to custom information from plugins provided by Puppet modules).
* `hiera` - provides a configurable hierarchy of data used by manifests and moudles.
* `mco` (Marionette Collective) - orchestration.


```bash
ssh  -o UserKnownHostsFile=/dev/null \
    -o StrictHostKeyChecking=no \
    root@myhost.com \
    -C "/root/stopallcontainers.sh; puppet agent --test; exit 0"
```

## Manifests

```bash
puppet apply my-manifest.pp
```

* Resources of a given type must have a unique title.
* [Relationships and ordering](http://docs.puppetlabs.com/puppet/latest/reference/lang_relationships.html)
* [Values and data types](http://docs.puppetlabs.com/puppet/latest/reference/lang_data.html)
* [Resource references](http://docs.puppetlabs.com/puppet/latest/reference/lang_data_resource_reference.html)

[(ref)](https://www.safaribooksonline.com/library/view/learning-puppet-4/9781491907993/ch05.html)

* Variables
  * Names start with `$` and a lowercase letter, contain lowercase letters, numbers, underscores.
  * Assignment: `$my_name = 'Joe'`
  * Cannot be redefined (within a namespace/scope)
* String constants: `'my string'` or `unquoted`
  * [Reserved  words](https://docs.puppetlabs.com/puppet/latest/reference/lang_reserved.html) must be quoted.
* String interpolation: `"value is $my_list[1] or ${num_tokens}"` (curly brackets are preferred?)
* Comments: `#`

[Expressions and operators](http://docs.puppetlabs.com/puppet/4.2/reference/lang_expressions.html)
* Operators: `+ - * / % << >>`
  * Add elements to a list: `$mylist + [14,17]`
  * Add pair to a hash: `$key_pairs + { gid => 500 }`
  * Append to array: `$my_list << 33` or `$my_list << [33, 55]` (added as a child array)
* [Conditionals](http://docs.puppetlabs.com/puppet/4.2/reference/lang_conditional.html): `== != < >=`
  * String operators are case insensitive
  * Substing operators are case sensitive: `'Fee' !in 'coffee'` (`in !in`)
  * Array and hash equality of both lenght and value.  `in` matches values in arrays and keys in hashes.
  * Booleans: `and or !`
  * Regex: `$str =~ /tea/` or `$str !~ /coffee/`

Statements:

```puppet
if (expr) { ... } elsif (expr) { ... } else { ... }

unless (expr) { ... } else { ... }

case $var {
  'string-val': { ... }
  $varmatch:    { ... }
  /regex/:      { ... }
  func($param): { ... }
  default:      { }

# Selectors return a value
$res =  $selector ? {
  'string-val': 'val1',
  $varmatch:    'val2',
  /regex/:      'val3',
  func($param): 'val4',
  default:      'val5',
}
```

Lambda blocks:

```puppet
| $firstvalue, $secondvalue | {
  block of code which operates on these values.
}
```

[Iteration and loops](http://docs.puppetlabs.com/puppet/4.2/reference/lang_iteration.html)

* [`each`](http://docs.puppetlabs.com/references/4.2.latest/function.html#each) -
    invoke lambda for every entry in an array or key-value pair in a hash.
    Hashes get `|$key,$value|` or `|$array|` (of key,value), arrays get `|$value|` or `|$0-based-index, $value|`
```puppet
each( $facts['partitions'] ) |$name, $device| {
  notice( "${facts['hostname']} has device $name with size ${device['size']} (${device['size_bytes']})" )
}

['sally', 'joe'].each() | $name | { ... }
['sally', 'joe'].each() | $index, $name | { ... } # 0-based

```
* [`filter`](http://docs.puppetlabs.com/references/4.2.latest/function.html#filter) -
    return only array/hash elements that match the lambda
```puppet
$ips = $facts.filter |$key,$value| {
  $key =~ /^ipaddress6?_/
}
```

* [`map`](http://docs.puppetlabs.com/references/4.2.latest/function.html#map) -
    apply lambda to each value, returning array of results.  If applied to a map, an array of [key,value] is
    passed to the lambda.

```puppet
$ips = $insts.map |$entry| {
  $pair[1]  # value of hash entry
}
```

* [`reduce`](http://docs.puppetlabs.com/references/4.2.latest/function.html#reduce) -
    combine values from array or hash into a single value, starting from the (optional) seed.

```puppet
$facts['partitions'].reduce(0) | $total, $partition | {
  total + $partition[1]['size']
}
```

* [`slice`](http://docs.puppetlabs.com/references/4.2.latest/function.html#slice)


## [Facter](http://docs.puppetlabs.com/facter/3.0/)

Discovers and reports per-node facts.

```bash
facter | grep version
facter | grep mb
facter --yaml
facter --json
```

Access in a manifest: `$content = "Host ${facts['hostname']}"`

## Docker

Run Docker containers using Puppet.

* [Plugin info](https://forge.puppetlabs.com/garethr/docker/readme), [GitHub](https://github.com/garethr/garethr-docker)

## Testing

* [Beaker](https://github.com/puppetlabs/beaker) - test framework.
* [Serverspec](http://serverspec.org/resource_types.html) - RSpec tests for servers, used by Beaker

## Hiera / Roles / Profiles

* [Hiera 1 documentation](https://docs.puppetlabs.com/hiera/1/index.html)
* <http://rnelson0.com/2014/07/14/intro-to-roles-and-profiles-with-puppet-and-hiera/>

### Configuration in `hiera.yaml`
```yaml
---
:backends:
  - yaml
:hierarchy:
  - "nodes/%{clientcert}"
  - "nodes/%{fqdn}"
  - "stack/%{stack_name}"
  - "roles/%{puppet_role}"
  - "%{environment}"
  - common

:yaml:
  :datadir: "data/development"
```

### [Automatic parameter lookup](https://docs.puppetlabs.com/hiera/1/puppet.html#automatic-parameter-lookup)

Define value for `myclass::parameter_one` 
```yaml
# /etc/puppet/hieradata/web01.example.com.yaml    ---
myclass::parameter_one: "Node-specific value for the parameter"
```

For a class with a parameter:
```puppet
# In this example, $parameter's value gets set when `myclass` is eventually declared.
# Class definition:
class myclass ($parameter_one = "default text") {
  file {'/tmp/foo':
    ensure  => file,
    content => $parameter_one,
  }
}
```

Then `include myclass` for every node, and the values will get injected.

Parameter lookup order:
1. Resource-like declaration/assignment, will always use any parameters that were explicitly set.
2. Hiera lookup using `<CLASS NAME>::<PARAMETER NAME>` as the lookup key.
3. Default value from the class's definition.
4. Fail with compilation error.

### [Lookup functions](https://docs.puppetlabs.com/hiera/1/puppet.html#hiera-lookup-functions)

* `hiera(key, [default], [override-hierarchy-level-name])` - most specific value (standard priority lookup)
* `hiera_array` - gets all string or array values across the hierarchy (into a single flat array)
* `hiera_hash` - hash merge lookup.

### [Structured data](https://docs.puppetlabs.com/hiera/1/puppet.html#interacting-with-structured-data-from-hiera)

Hiera lookup functions and parameter lookup can only access the top-level key - cannot descend into deeploy nested data structures. e.g. for
```yaml
# /etc/puppet/hieradata/appservers.yaml
---
proxies:
  - hostname: lb01.example.com
    ipaddress: 192.168.22.21
  - hostname: lb02.example.com
    ipaddress: 192.168.22.28
```
Must use
```puppet
# Get the structured data:
$proxies = hiera('proxies')
# Index into the structure:
$use_ip = $proxies[1]['ipaddress'] # will be 192.168.22.28
```
Not
```puppet
# Try to skip a step, and give Hiera something it doesn't understand:
$use_ip = hiera( 'proxies'[1]['ipaddress'] ) # will explode
```

### [Assigning Classes to Nodes with hiera_include](https://docs.puppetlabs.com/hiera/1/puppet.html#assigning-classes-to-nodes-with-hiera-hierainclude)

Add `hiera_include('classes')` to your main manifest (e.g. `site.pp`).  Then can add `classes` keys to Hiera files to include those classes for each node.  e.g. the Ubuntu node `web01.example.com.yaml` would get all classes defined below:
```yaml
# common.yaml
---
classes:
  - base
  - security
  - mcollective

# Debian.yaml
---
classes:
  - base::linux
  - localrepos::apt

# web01.example.com.yaml
---
classes:
  - apache
  - apache::passenger
```

### Generating resources ([ref](https://ask.puppetlabs.com/question/1018/how-to-manage-users-account-using-hiera/?answer=1019#post-id-1019))

Create a helper class to collect values from hiera and create resources, e.g.
```puppet
class profile::groups($groups){
  create_resources(group, $groups)
}
```

Then in hiera:
```yaml
profile::groups::groups:
  content:
    gid: 602
  weblogic:
    gid: 600
```

## Modules

### [apache](https://forge.puppetlabs.com/puppetlabs/apache)
* [GitHub](https://github.com/puppetlabs/puppetlabs-apache)
* [apache::vhost](https://forge.puppetlabs.com/puppetlabs/apache#defined-type-apachevhost) - [examples](https://forge.puppetlabs.com/puppetlabs/apache#virtual-host-examples)

## [Puppet dependencies and order](http://garylarizza.com/blog/2014/10/19/on-dependencies-and-order/)

* Puppet's stance: if there are failures, try to get as much of the system into a working state as possible (e.g. set SSH keys even if other service fails).  Not really needed if can rebuild from scratch, but helpful if there is some manual config.
* This is why order of resources without dependencies is important.  Now manifest ordering (top-to-bottom), but used to be title hash (but still predictable).

* Use dependency metaparameters like ‘before’, ‘require’, ‘notify’, and ‘subscribe’ if resources in a catalog NEED to be evaluated in a particular order
* Do not use Manifest Ordering as a substitute for explicitly setting dependencies (disable it if this is too tempting)
* Use Roles and Profiles for a logical module layout (see: <http://bit.ly/puppetworkflows2> for information on Roles and Profiles)
* Order individual components inside the Profile
* Order Profiles (if necessary) inside the Role
