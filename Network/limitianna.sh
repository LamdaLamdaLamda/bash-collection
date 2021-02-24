#!/bin/bash
###################################################################
#Script Name  : limitiana.sh
#Description  : Drops traffic from IANA IPs.
#Args         : None.
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if test "$(id -u)" -ne 0
then
  echo -e "[\u2715] Missing privileges..."
  exit 1
fi

echo -e "\u2328 Dropping traffic for IANA Ips"

echo -e "\u2328 IANA - Local Identification"
iptables -A INPUT -s 0.0.0.0/7 -j DROP

echo -e "\u2328 RIPE NCC"
iptables -A INPUT -s 2.0.0.0/8 -j DROP

echo -e "\u2328 RIPE NCC"
iptables -A INPUT -s 5.0.0.0/8 -j DROP

echo -e "\u2328 DoD Network Information Center"
iptables -A INPUT -s 7.0.0.0/8 -j DROP

echo -e "\u2328 IANA - Private Use"
iptables -A INPUT -s 10.0.0.0/8 -j DROP

echo -e "\u2328 ARIN"
iptables -A INPUT -s 23.0.0.0/8 -j DROP

echo -e "\u2328 APNIC"
iptables -A INPUT -s 27.0.0.0/8 -j DROP

echo -e "\u2328 RIPE NCC"
iptables -A INPUT -s 31.0.0.0/8 -j DROP

echo -e "\u2328 APNIC"
iptables -A INPUT -s 36.0.0.0/7 -j DROP

echo -e "\u2328 APNIC"
iptables -A INPUT -s 39.0.0.0/8 -j DROP

echo -e "\u2328 APNIC"
iptables -A INPUT -s 42.0.0.0/8 -j DROP

echo -e "\u2328 APNIC"
iptables -A INPUT -s 49.0.0.0/8 -j DROP

echo -e "\u2328 ARIN"
iptables -A INPUT -s 50.0.0.0/8 -j DROP

echo -e "\u2328 RIPE NCC"
iptables -A INPUT -s 77.0.0.0/8 -j DROP

echo -e "\u2328 RIPE NCC"
iptables -A INPUT -s 78.0.0.0/7 -j DROP

echo -e "\u2328 ARIN"
iptables -A INPUT -s 92.0.0.0/6 -j DROP

echo -e "\u2328 ARIN"
iptables -A INPUT -s 96.0.0.0/4 -j DROP

echo -e "\u2328 APNIC"
iptables -A INPUT -s 112.0.0.0/5 -j DROP

echo -e "\u2328 APNIC"
iptables -A INPUT -s 120.0.0.0/8 -j DROP

echo -e "\u2328 ARIN"
iptables -A INPUT -s 169.254.0.0/16 -j DROP

echo -e "\u2328 ARIN"
iptables -A INPUT -s 172.16.0.0/12 -j DROP

echo -e "\u2328 ARIN"
iptables -A INPUT -s 173.0.0.0/8 -j DROP

echo -e "\u2328 ARIN"
iptables -A INPUT -s 174.0.0.0/7 -j DROP

echo -e "\u2328 RIPE NCC"
iptables -A INPUT -s 176.0.0.0/5 -j DROP

echo -e "\u2328 RIPE NCC"
iptables -A INPUT -s 184.0.0.0/6 -j DROP

echo -e "\u2328 ARIN"
iptables -A INPUT -s 192.0.2.0/24 -j DROP

echo -e "\u2328 AFRINIC"
iptables -A INPUT -s 197.0.0.0/8 -j DROP

echo -e "\u2328 ARIN"
iptables -A INPUT -s 198.18.0.0/15 -j DROP

echo -e "\u2328 APNIC"
iptables -A INPUT -s 223.0.0.0/8 -j DROP

echo -e "\u2328 APNIC"
iptables -A INPUT -s 224.0.0.0/3 -j DROP
