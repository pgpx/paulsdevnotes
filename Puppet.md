# Puppet notes

* <https://puppetlabs.com/>
* [Open Source Docs](https://docs.puppetlabs.com/puppet/)
* [Type Ref](https://docs.puppetlabs.com/references/latest/type.html), [Language Ref](https://docs.puppetlabs.com/puppet/latest/reference/lang_summary.html)

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

### [Notify](https://docs.puppetlabs.com/references/latest/type.html#notify)
```puppet
notify { 'resource title':
  name     => # (namevar) An arbitrary tag for your own reference; the...
  message  => # The message to be sent to the...
  withpath => # Whether to show the full object path. Defaults...
  # ...plus any applicable metaparameters.
}
```

## Manifests

[(ref)](https://www.safaribooksonline.com/library/view/learning-puppet-4/9781491907993/ch05.html)

* Variables
  * Names start with `$` and a lowercase letter, contain lowercase letters, numbers, underscores.
  * Assignment: `$my_name = 'Joe'`
  * Cannot be redefined (within a namespace/scope)
* String constants: `'my string'` or `unquoted`
  * [Reserved  words](https://docs.puppetlabs.com/puppet/latest/reference/lang_reserved.html) must be quoted.
* String interpolation: `"value is $my_list[1] or ${num_tokens}"` (curly brackets are preferred?)
* Comments: `#`
* Operators: `+ - * / % << >>`
  * Add elements to a list: `$mylist + [14,17]`
  * Add pair to a hash: `$key_pairs + { gid => 500 }`
  * Append to array: `$my_list << 33` or `$my_list << [33, 55]` (added as a child array)
* Conditionals: `== != < >=`
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

```ruby
| $firstvalue, $secondvalue | {
  block of code which operates on these values.
}
```

## [Facter](http://docs.puppetlabs.com/facter/3.0/)

Discovers and reports per-node facts.

```bash
facter | grep version
facter | grep mb
facter --yaml
facter --json
```

Access in a manifest: `$content = "Host ${facts['hostname']}"`

## Docker

Run Docker containers using Puppet.

* [Plugin info](https://forge.puppetlabs.com/garethr/docker/readme), [GitHub](https://github.com/garethr/garethr-docker)
