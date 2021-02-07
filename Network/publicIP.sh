#!/bin/bash
###################################################################
#Script Name  : publicIP.sh
#Description  : Return the public IPv4.
#Args         : None
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
PUBLIC_IP=$(curl -s ipinfo.io/ip)
echo -e "\u2328 Public-IP: $PUBLIC_IP"
