#!/bin/bash
###################################################################
#Script Name  : activatenetworkprotection.sh
#Description  : Configures the sysFS configuration to archieve a hardened
#               network configuration.
#Args         : None
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if test `id -u` -ne 0
then
  echo -e "[\u2715] Missing privileges..."
  exit 1
fi

echo -e "\u2328 Enabling TCP SYN cookie protection"
sysctl -w net.ipv4.tcp_syncookies=1 1>/dev/null
sysctl -w net.ipv4.tcp_synack_retries=5 1>/dev/null

echo -e "\u2328 Disable IP-source routing"
sysctl -w net.ipv4.conf.all.accept_source_route=0 1>/dev/null

echo -e "\u2328 Disable ICMP redirect"
sysctl -w -q net.ipv4.conf.all.accept_redirects=0 1>/dev/null
sysctl -w net.ipv6.conf.all.accept_redirects=0 1>/dev/null
sysctl -w net.ipv4.conf.default.accept_redirects=0 1>/dev/null
sysctl -w net.ipv6.conf.default.accept_redirects=0 1>/dev/null

echo -e "\u2328 Only accept ICMP redirects on trusted gateways"
sysctl -w net.ipv4.conf.all.secure_redirects=1 1>/dev/null

echo -e "\u2328 Deactivating ICMP redirects"
sysctl -w net.ipv4.conf.all.send_redirects=0 1>/dev/null

echo -e "\u2328 Ignoring broadcast requests"
sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1 1>/dev/null

echo -e "\u2328 Activating Reverse Path Filtering"
sysctl -w net.ipv4.conf.all.rp_filter=1 1>/dev/null

echo -e "\u2328 Applying changes"
sysctl -p
