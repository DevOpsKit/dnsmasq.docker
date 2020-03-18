#!/usr/bin/env bash

set -o pipefail

LC_ALL=C
LANG=C
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export LC_ALL LANG PATH

declare -r DNSMASQ_CONFIG=/data/dnsmasq.conf
declare -r RESOLV_CONFIG=/data/resolv.conf


# if volume with config, use it
if [ -f "${DNSMASQ_CONFIG}" ];
then \
    rm -f /etc/dnsmasq.conf
	ln -s "${DNSMASQ_CONFIG}" /etc/dnsmasq.conf
fi

if [ -f "${RESOLV_CONFIG}" ];
then \
    rm -f /etc/dnsmasq.conf
	ln -s "${RESOLV_CONFIG}" /etc/dnsmasq.conf
fi

exec dnsmasq $@ -n -d -C /etc/dnsmasq.conf 