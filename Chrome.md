# Chrome

## <chrome://net-internals>

### Clear HSTS errors ([ref](https://andystechlife.wordpress.com/2016/09/18/how-to-clear-hsts-settings-in-chrome-and-firefox/))

Go to <chrome://net-internals/#hsts> and query/delete the problematic domain.

### Proxy configuration

* Debug Chrome proxy config ([StackOverflow](http://superuser.com/a/343582/108786))
    * Effective proxy settings: `chrome://net-internals/proxyservice.config#proxy` (re-apply will update them immediately, e.g. if PAC file has changed)
    * Events: `chrome://net-internals/proxyservice.config#events` - capture traffic, logging evaluation of PAC files, etc.

### Clear invalid DNS entries

e.g. if unexpectedly getting Cert/authentication requests from sites usually visited over a VPN:

Go to <chrome://net-internals/#dns> and click 'Clear host cache'
