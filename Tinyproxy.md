# [Tinyproxy](https://tinyproxy.github.io/)

* <https://tinyproxy.github.io/>
* [Using Tinyproxy for Mobile Development on OS X](Using Tinyproxy for Mobile Development on OS X)
* [TinyProxy Max install guide](https://gist.github.com/RobbieClarken/4743751)
* Alternatives? <http://www.privoxy.org/> (supports Windows)

## Mac install

```bash
brew install tinyproxy
```

To launch on startup:

```bash
brew services start tinyproxy
```

(block incoming connections on the Mac firewall)

To run on demand:

```bash
tinyproxy
```

Config file: `/usr/local/etc/tinyproxy.conf`

## Configuration with Docker for Mac

Docker for Mac containers can't see `localhost` directly, so create an alias for the `lo0` (loopback) interface (from the [Docker for Mac networking manual](https://docs.docker.com/docker-for-mac/networking/#use-cases-and-workarounds)):

```bash
sudo ifconfig lo0 alias 10.200.10.1/24
```

See this new configuration as an extra line in `ifconfig -a`:

    lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 16384
    options=1203<RXCSUM,TXCSUM,TXSTATUS,SW_TIMESTAMP>
    inet 127.0.0.1 netmask 0xff000000 
    inet6 ::1 prefixlen 128 
    inet6 fe80::1%lo0 prefixlen 64 scopeid 0x1 
    inet 10.200.10.1 netmask 0xffffff00     <-- New alias 
    nd6 options=201<PERFORMNUD,DAD>

Then add this as an allowed IP address as to `tinyproxy.conf`:

    Allow 10.200.10.1
    
Configure Docker for Mac to use the proxy:

* Docker -> Preferences -> Proxies -> Web Server (HTTP) = `10.200.10.1:8888`
    * Bypass proxy settings for these Hosts & Domains = `.local,192.168.0.1,localhost,127.0.0.1` (at least)

Set the `http_proxy` environment variable when building Docker images:

```bash
docker build --build-arg http_proxy="10.200.10.1:8888" \
    --tag my-image .
```