# Puppet notes

* <https://puppetlabs.com/>
* [Open Source Docs](https://docs.puppetlabs.com/puppet/)
* [Type Ref](https://docs.puppetlabs.com/references/latest/type.html)
* [Language Ref](https://docs.puppetlabs.com/puppet/latest/reference/lang_summary.html)
* [Function Ref](http://docs.puppetlabs.com/references/4.2.latest/function.html)

## Books / Videos / Websites

* [Learning Puppet (video)](https://www.safaribooksonline.com/library/view/learning-puppet/9781771373487/)
* [Learning Puppet 4](https://www.safaribooksonline.com/library/view/learning-puppet-4/9781491907993/)
* [Puppet Best Practices](https://www.safaribooksonline.com/library/view/puppet-best-practices/9781491922996/)
* [Puppet Cookbook](http://www.puppetcookbook.com/)

## Commands

* `puppet`
* `facter`- evaluates a system and provides a number of facts about it (including node-specific information like architecture, hostname, and IP address, in addition to custom information from plugins provided by Puppet modules).
* `hiera` - provides a configurable hierarchy of data used by manifests and moudles.
* `mco` (Marionette Collective) - orchestration.

## Resources

```puppet
resource_type { 'resource_title':
  ensure     => present,         # usually 'present' or 'absent'
  attribute1 => 1234,            # number
  attribute2 => 'value',         # string
  attribute3 => ['red','blue'],  # array
  noop       => false,           # boolean
}
```
[(ref)](https://www.safaribooksonline.com/library/view/learning-puppet-4/9781491907993/ch04.html)

Convert system state into Puppet code / modify state:

```bash
# Show the current state of the named file
puppet resource file /tmp/testfile.txt

# Change state with name=val pairs
puppet resource file /tmp/testfile.txt content='New content'
```

### [Metaparameters](https://docs.puppetlabs.com/references/latest/metaparameter.html)
Attributes that apply to all resource types.
* [`alias`](https://docs.puppetlabs.com/references/latest/metaparameter.html#alias) -
    use to refer to resource if title is complex.
* [`audit`](https://docs.puppetlabs.com/references/latest/metaparameter.html#audit)` => true` -
    (audit) log when a resource has changed (even if you don't want to manage its contents).
* [`before`](https://docs.puppetlabs.com/references/latest/metaparameter.html#before)
* [`loglevel`](https://docs.puppetlabs.com/references/latest/metaparameter.html#loglevel)` => [debug|info|notice|warning|err|alert|emerg|crit]` - used to log changes to resource.
* [`noop`](https://docs.puppetlabs.com/references/latest/metaparameter.html#noop)` => true` -
    do not make any changes (just log)
* [`notify`](https://docs.puppetlabs.com/references/latest/metaparameter.html#notify)
* [`require`](https://docs.puppetlabs.com/references/latest/metaparameter.html#require)
* [`schedule`](https://docs.puppetlabs.com/references/latest/metaparameter.html#schedule)
* [`stage`](https://docs.puppetlabs.com/references/latest/metaparameter.html#stage)
* [`subscribe`](https://docs.puppetlabs.com/references/latest/metaparameter.html#subscribe)
* [`tag`](https://docs.puppetlabs.com/references/latest/metaparameter.html#tag)` => ['mytag1', 'mytag2']` -
    used limit resources applied to those matching a tag.
    Resources automatically get a tag of their resource name (as well as those explicitly defined).
```bash
puppet apply manifest.pp --tags package,mytag1  # At least one tag must match
```

### [Exec](https://docs.puppetlabs.com/references/latest/type.html#exec)
Execute a command, _must_ be idempotent (able to run multiple times).
```puppet
exec { 'resource title':
  command     => 'echo "test" > testfile.txt', # (namevar) The actual command to execute, defaults to title
  creates     => '/tmp/testfile.txt', # A file to look for before running the command...
  cwd         => '/tmp', # The directory from which to run the command.
  environment => # Any additional environment variables you want to 
  group       => # The group to run the command as.  This seems to...
  logoutput   => on_failure, # Whether to log command output in addition to...
  onlyif      => # If this parameter is set, then this `exec` will...
  path        => ['bin'], # The search path used for command execution...
  provider    => # The specific backend to use for this `exec...
  refresh     => # Optionally specify a different command for refreshing.
  refreshonly => # The command should only be run as a refresh...
  returns     => [0], # The expected exit code(s), error if none of these.
  timeout     => # seconds, default 300
  tries       => # The number of retries, default 1
  try_sleep   => # The time to sleep in seconds between...
  umask       => # Sets the umask to be used while executing this...
  unless      => # If this parameter is set, then this `exec` will...
  user        => # The user to run the command as.  Note that if...
  # ...plus any applicable metaparameters.
}
```


### [File](https://docs.puppetlabs.com/references/latest/type.html#file)
```puppet
file { '/my/file.txt':
  ensure => present,
  path => '/my/file.txt', # optional, defaults to title
  content => 'hello there',
  group => 'mygroup',
  owner => 'myowner',
  mode => '0644',
}
```

### [Notify](https://docs.puppetlabs.com/references/latest/type.html#notify)
Show a message
```puppet
notify { 'resource title':
  name     => # (namevar) An arbitrary tag for your own reference; the...
  message  => # The message to be sent to the...
  withpath => # Whether to show the full object path. Defaults...
  # ...plus any applicable metaparameters.
}
```

## Manifests

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

