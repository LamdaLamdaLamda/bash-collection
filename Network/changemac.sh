#!/bin/bash
###################################################################
#Script Name  : changemac.sh
#Description  : Changes the MAC-adress for the given interface.
#Args         : 1. Network interface
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if test $(id -u -n) != "root"
    then
    echo -e  "\u2715 Missing root privileges..."
    exit 1
fi

echo -e "\u2328 Changing MAC-address for $1"
echo -e "\u2328 Stopping network interface $1"
ip link set dev $1 down

if test $? -eq 0
then
    ip link set dev $1 address $(($RANDOM % 15)):a4:92:$(($RANDOM % 15)):$(($RANDOM % 15)):$(($RANDOM % 15)) # Netzwerkkarte neue MAC zuweisen

    if test $? -eq 0
    then
        echo -e "\u2714 MAC-address successfully changed..."
        ip link set dev $1 up

        if test $? -eq 0
        then
          echo -e "\u2714 Network interface $1 restarted"
          exit 0
        else
          echo -e "\u2715 Restart of $1 failed"
          exit 1
        fi
    else
        echo -e"\u2715 Changing MAC-address failed..."
        exit 1
    fi
fi
