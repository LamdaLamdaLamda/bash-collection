#!/bin/bash
###################################################################
#Script Name  : activatemonitormode.sh
#Description  : Activates monitor mode for the desired interface.
#Args         : 1. Desired interface for the monitor mode
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if test $(id -u -n) != "root"
    then
    echo -e  "\u2715 Missing root privileges..."
    exit 1
fi

echo -e "\u2328 Shutting down $1 interface"
# Deactivating network interface
ifconfig $1 down

echo -e "\u2328 Activating monitor mode on $1"
# Activating monitor mode on desired interface
iwconfig $1 mode monitor
echo -e "\u2328 Reactivating interface"
ifconfig $1 up

if test $? -eq 0
then
  echo -e "\u2714 Monitor mode is activated for $1"
else
  echo -e "\u2715 Setting $1 to monitor mode failed"
  exit 1
fi
