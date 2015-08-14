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

### [Metaparameters](https://docs.puppetlabs.com/references/latest/metaparameter.html)
Attributes that apply to all resource types.
* alias
* audit
* before
* loglevel
* noop
* notify
* require
* schedule
* stage
* subscribe
* tag

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
