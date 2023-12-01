# Chrome

## <chrome://net-internals>

## Shortcut keys

* [21 Chrome shortcuts you need to know](https://www.cnet.com/tech/computing/21-chrome-shortcuts-you-need-to-know/)
* `Cmd+Up/Down` - top/bottom of page
* `Opt+Up/Down` - page up/down

### Clear HSTS errors ([ref](https://andystechlife.wordpress.com/2016/09/18/how-to-clear-hsts-settings-in-chrome-and-firefox/))

Go to <chrome://net-internals/#hsts> and query/delete the problematic domain.

### Proxy configuration

* <https://superuser.com/questions/1405499/chrome-72-seems-to-no-longer-accept-proxy-pac-url>

* <https://www.chromium.org/developers/design-documents/network-stack/debugging-net-proxy>
* Debug Chrome proxy config ([StackOverflow](http://superuser.com/a/343582/108786))
    * Effective proxy settings: `chrome://net-internals/proxyservice.config#proxy` (re-apply will update them immediately, e.g. if PAC file has changed)
    * Events: `chrome://net-internals/proxyservice.config#events` - capture traffic, logging evaluation of PAC files, etc.

### Clear invalid DNS entries

e.g. if unexpectedly getting Cert/authentication requests from sites usually visited over a VPN:

Go to <chrome://net-internals/#dns> and click 'Clear host cache'

NET::ERR_CERT_INVALID


he105142.emea1.cds.t-internal.com normally uses encryption to protect your information. When Google Chrome tried to connect to he105142.emea1.cds.t-internal.com this time, the website sent back unusual and incorrect credentials. This may happen when an attacker is trying to pretend to be he105142.emea1.cds.t-internal.com, or a Wi-Fi sign-in screen has interrupted the connection. Your information is still secure because Google Chrome stopped the connection before any data was exchanged.

You cannot visit he105142.emea1.cds.t-internal.com at the moment because the website sent scrambled credentials that Google Chrome cannot process. Network errors and attacks are usually temporary, so this page will probably work later.

Oh, I had to manually download the certificate (Chrome Dev Tools -> Security), then add it to Keychain Access on the Mac and then trust it (double click on it).  Now it is ok!
