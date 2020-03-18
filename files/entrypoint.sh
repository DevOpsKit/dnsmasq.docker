#!/usr/bin/env bash

set -o pipefail

LC_ALL=C
LANG=C
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export LC_ALL LANG PATH

declare -r DNSMASQ_CONFIG=/data/dnsmasq.conf

# if volume with config, use it
if [ -f "${DNSMASQ_CONFIG}" ];
then \
    rm -f /etc/dnsmasq.conf
	ln -s "${DNSMASQ_CONFIG}" /etc/dnsmasq.conf
fi
# else if env vars use them

exec dnsmasq $@ -n -d -C /etc/dnsmasq.conf 