#!/bin/bash
###################################################################
#Script Name  : disableipv6.sh
#Description  : Disables IPv6 by usig IP tables.
#Args         : None.
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if test "$(id -u)" -ne 0
then
  echo -e "[\u2715] Missing privileges..."
  exit 1
fi


echo -e "\u2328 Dropping INPUT/FORWARD/OUTPUT"
ip6tables -P INPUT DROP 2>/dev/null
ip6tables -P FORWARD DROP 2>/dev/null
ip6tables -P OUTPUT DROP 2>/dev/null

echo -e "\u2328 Delete all rules"
ip6tables -F 2>/dev/null
ip6tables -t mangle -F 2>/dev/null

echo -e "\u2328 Deleting chains"
ip6tables -X 2>/dev/null
ip6tables -t mangle -X 2>/dev/null

echo -e "\u2328 Zero packets"
ip6tables -Z 2>/dev/null
ip6tables -t mangle -Z 2>/dev/null