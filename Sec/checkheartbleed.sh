#!/bin/bash
###################################################################
#Script Name  : checkheartbleed.sh
#Description  : Determines whether the given host is vulnerable for heartbleed.
#Args         : 1.IP-Address
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if test "$(id -u -n)" != "root"
then
    echo -e  "\u2715 Missing root privileges..."
    exit 1
fi

if test $? != 0
then
  echo -e "\u2715 Target is unreachable"
  exit 1
fi

VULNERABLE="VULNERABLE"

echo -e "\u2328 Downloading NSE file..."
curl -s --output /tmp/ssl-heartbleed.nse https://svn.nmap.org/nmap/scripts/ssl-heartbleed.nse 1>>/dev/null

if test -e /tmp/ssl-heartbleed.nse
then
  echo -e "\u2328 Starting vulnerability check for heartbleed"
  SCAN=$(nmap -p 443 --script /tmp/ssl-heartbleed "$1")
  if [[ $SCAN =~ $VULNERABLE ]]
  then
    echo -e "\u2715 Vulnerable!"
    exit 0
  else
    echo -e "\u2714 Not vulnerable!"
    exit 0
  fi
else
  echo -e "\u2714 Download of NSE file failed"
  exit 1
fi
