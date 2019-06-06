# MacOS Networking

* [Routing tips for VPNs on OS X](https://gist.github.com/taldanzig/4628573)https://www.ibm.com/support/knowledgecenter/en/ssw_ibm_i_71/rzaja/rzajavpnnatex.htm
* [Scenario: Using network address translation for VPN]()

List network interfaces

```bash
ifconfig -a
```

## DNS

Lookup DNS information:

```bash
dig bbc.co.uk
```

(OS/X) Output DNS configuration (other systems might use `/etc/resolv.conf`):

```bash
scutil --dns
```

## Routing

Get routing information:

```bash
netstat -rn
```

Get the route taken to an address:

```bash
route get 10.199.99.99
```

## Tracing

Run a TCP dump on an interface + port:

```bash
tcpdump -n -i utun2 port 22
```

Try to connect to an address + port:

```bash
nc -v 10.199.135.102 53
```