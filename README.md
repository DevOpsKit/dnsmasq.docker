## What is dnsmasq?

Dnsmasq is a lightweight, easy to configure, DNS forwarder and DHCP server. It is designed to provide DNS and optionally, DHCP, to a small network. It can serve the names of local machines which are not in the global DNS. The DHCP server integrates with the DNS server and allows machines with DHCP-allocated addresses to appear in the DNS with names configured either in each host or in a central configuration file. Dnsmasq supports static and dynamic DHCP leases and BOOTP/TFTP for network booting of diskless machines (source from the [package description]:https://packages.debian.org/search?keywords=dnsmasq).

## How to download this image?
### Get it directly from the DockerHub

``` docker pull devopskit/dnsmasq:latest ```

## Or clone the repository on GitHub and buid the image yourself

``` git clone https://github.com/DevOpsKit/dnsmasq.docker.git ```

``` cd dnsmasq.docker ```

``` docker build -t dnsmask-docker . ```

## How to run this image?

``` docker run -d -p 53:53/udp devopskit/dnsmasq:latest ```

To use your own dnsmasq.conf or resolv.conf:

``` docker run -v /your/local/path:/data -d -p 53:53/udp devopskit/dnsmasq:latest ```

To configure dnsmasq using options to the command dnsmasq, you can send them as additional arguments to the entrypoint:

``` docker run -v /your/local/path:/data -d -p 53:53/udp devopskit/dnsmasq:latest -a 192.1680.x.x ```

With a combination of commands and configuration files in /data you can tune dnsmasq as you wish.