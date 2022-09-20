# ip

* `ip address` - shows current IP config
* `ip link show` - shows current interfaces:
  * `lo` - loopback
  * `ens3` - physical (virtual) cable.  kernel's idea of what the state is:
    * `\<LOWER_UP>` and `\<UP>` - cable is plugged in and link light blinks
    * `mtu 1500`
  * `docker0` - docker bridge
* `ip r` - show default route - `default via`
