# Puppet Resources

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

## [Metaparameters](https://docs.puppetlabs.com/references/latest/metaparameter.html)
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

## [Exec](https://docs.puppetlabs.com/references/latest/type.html#exec)
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


## [File](https://docs.puppetlabs.com/references/latest/type.html#file)
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

## [Notify](https://docs.puppetlabs.com/references/latest/type.html#notify)
Show a message
```puppet
notify { 'resource title':
  name     => # (namevar) An arbitrary tag for your own reference; the...
  message  => # The message to be sent to the...
  withpath => # Whether to show the full object path. Defaults...
  # ...plus any applicable metaparameters.
}
```

## [sshd_config](https://forge.puppetlabs.com/herculesteam/augeasproviders_ssh#sshd_config-provider)

In module `herculesteam/augeasproviders_ssh`

Make changes to `/etc/ssh/sshd_config` ([see](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man5/sshd_config.5?query=sshd_config) `man sshd_config` for options).

```puppet
# Increase the number of unauthenticated connections allowed (e.g. if automated tests are logging in)
sshd_config { 'MaxStartups':
  ensure => present,
  value => 50
} ~>
service { 'sshd':
  ensure => running
}
```

## [User](https://docs.puppetlabs.com/references/latest/type.html#user)

Set a password ([SO](http://stackoverflow.com/a/32034759/125246))
```puppet
user { 'username':
  password => pw_hash('password', 'SHA-512', 'mysalt'),
  home => '/home/username',
  managehome => true,
  groups => [ 'group1', 'group2' ]
}
```
