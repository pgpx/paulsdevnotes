# arp

* `arp -an` - get MAC address
* `arp -an 172.17.0.1` - route to default gateway

For forwarding to happen:

* `cat /proc/sys/net/ipv4/ip_forward` - value 1 will allow forwarding (accept packets not for your ip address), value 0 will not accept any other packets.
  * This is generic setting for all interfaces
  * `/proc/sys/net/ipv4/conf/docker0/forwarding` - same for individual interface (only writes to internal memory, doesn't survive reboot)
  * `sysctl -a | grep forward` - net.ipv4.config.all.forwarding = 1, net.ipv4.(?)conf.veth2.forwarding = 1

