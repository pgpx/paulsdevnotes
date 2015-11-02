# Puppet Role and Profile pattern

## Links

* <http://garylarizza.com/blog/2014/02/17/puppet-workflow-part-1/>
* <http://garylarizza.com/blog/2014/02/17/puppet-workflow-part-2/>
* <http://garylarizza.com/blog/2013/12/08/when-to-hiera/>
* <http://rnelson0.com/2014/10/20/rewriting-a-puppet-module-for-use-with-hiera/>
* <http://sysadvent.blogspot.co.uk/2012/12/day-13-configuration-management-as-legos.html>
* <http://www.slideshare.net/PuppetLabs/roles-talk>
* <http://www.craigdunn.org/2012/05/239/>
* <http://rnelson0.com/2014/07/14/intro-to-roles-and-profiles-with-puppet-and-hiera/>
* <http://garylarizza.com/blog/2013/12/08/when-to-hiera/>
* <https://docs.puppetlabs.com/hiera/1/complete_example.html>
* <http://rnelson0.com/2015/05/14/hiera-fy-your-hiera-setup/#more-1451>
* <https://github.com/pzim/reaktor>
* <http://rnelson0.com/2015/04/15/improved-r10k-deployment-patterns/>
* <https://docs.puppetlabs.com/puppet/latest/reference/environments_configuring.html>
* <http://garylarizza.com/blog/2014/08/31/r10k-plus-directory-environments/>
* <https://puppetlabs.com/webinars/git-workflow-best-practices-deploying-r10k>
* <https://puppetlabs.com/blog/refactor-your-monolithic-code-repo-to-deploy-with-r10k>

## [Component modules](http://garylarizza.com/blog/2014/02/17/puppet-workflow-part-1/)

Component modules are the lowest level in your deployment, and are modules that configure specific pieces of technology (like apache, ntp, mysql, and etc…). Component modules are well-encapsulated, have a reasonable API, and focus on doing small, specific things really well (i.e. the *nix way).
* <https://www.devco.net/archives/2012/12/13/simple-puppet-module-structure-redux.php>
* <http://docs.puppetlabs.com/guides/module_guides/bgtm.html>

`::params` class used so that you can access variables from elsewhere (could not happen if the class contained resources because accessing it would enfoce the state of those resources).  Need to inherit this class to access it (don't use/need inheritance anywhere else!):

```puppet
class apache (
  $port = $apache::params::port,
  $user = $apache::params::user,
) inherits apache::params {
```

* Do not use Hiera lookups in component modules (makes it hard to see where hiera values are used) - keep them to profiles.
* Keep modules generic (without company-specific info).
* Smaller and more task specific (e.g. don't declare packages for shared libraries or other components).

## [Profiles](http://garylarizza.com/blog/2014/02/17/puppet-workflow-part-2/)

* Wrapper class that groups Hiera lookups and class declarations into one functional unit.
  e.g. Install Wordpress = apache, apache::vhost, users, groups, MySQL db, etc.
* Name according to the technology they setup (e.g. `profiles::ssh::server`), not org unit (because they should be reusable).

Do all Hiera lookups in the profile:

```puppet
class profiles::wordpress {
  ## Hiera lookups
  $site_name               = hiera('profiles::wordpress::site_name')
  ## ...
  ## Create user
  ## Configure mysql
  ## Configure apache
  ## Configure wordpress
  class { '::wordpress':
    install_dir => $wordpress_docroot,
  }
}
```

* Easier to debug (only one place where Hiera is used, component modules must be getting their values from parameters or defaults in ::params, not Hiera).
* Have no default values - don't want to forget to put data in Hiera when making a change (e.g. for other components that use it).
* Use parameterized class declarations and explicitly pass values you care about (since profiles will be 'included' by roles, this is ok because classes will only get declared by profiles).
* Watch out for relative namespacing: inside `profile::wordpress` have to use `::wordpress` to use a wordpress component (since `wordpress` would refer to `profile::wordpress`).
