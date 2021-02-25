#!/bin/bash
###################################################################
#Script Name  : limiticmp.sh
#Description  : Limits the ICMP traffic to 
#             : suppress malicous ICMP packet.
#Args         : None.
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################


echo -e "\u2328 Using rate limit with 3 packet per second with 20 matches"

iptables -N ICMP_DROP
iptables -N ICMP_RELATED

echo -e "\u2328 Dropping all fragmented ICMP packets"
iptables -A INPUT -p icmp --fragment -j ICMP_DROP
iptables -A OUTPUT -p icmp --fragment -j ICMP_DROP
iptables -A FORWARD -p icmp --fragment -j ICMP_DROP

echo -e "\u2328 Allowing ESTABLISHED ICMP traffic"
iptables -A INPUT -p icmp -m state --state ESTABLISHED -j ACCEPT -m limit --limit 3/s --limit-burst 8
iptables -A OUTPUT -p icmp -m state --state ESTABLISHED -j ACCEPT -m limit --limit 3/s --limit-burst 8

echo -e "\u2328 Allow ICMP related traffic"
iptables -A INPUT -p icmp -m state --state RELATED -j ICMP_RELATED -m limit --limit 3/s --limit-burst 8
iptables -A OUTPUT -p icmp -m state --state RELATED -j ICMP_RELATED -m limit --limit 3/s --limit-burst 8

echo -e "\u2328 Allowing ICMP echo requests with rate limit"
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT -m limit --limit 3/s --limit-burst 8
iptables -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT -m limit --limit 3/s --limit-burst 8

echo -e "\u2328 Dropping any other ICMP traffic"
iptables -A INPUT -p icmp -j ICMP_DROP
iptables -A OUTPUT -p icmp -j ICMP_DROP
iptables -A FORWARD -p icmp -j ICMP_DROP
