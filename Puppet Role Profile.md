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
