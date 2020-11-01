#!/bin/bash
###################################################################
#Script Name  : setproxy.sh
#Description  : Sets the proxy for the given option.
#Args         : 1. Option which indicates which proxy is going to be set.
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if test $(id -u -n) != "root"
    then
    echo -e  "\u2715 Missing root privileges..."
    exit 1
fi

GLOBAL_ENVIRON="/etc/environment"

if test $1 -eq "-ftp"
then
  echo -e "\u2328 Setting FTP-proxy"
  echo "ftp_proxy=$2" >> $GLOBAL_ENVIRON
  exit 0
fi

if test $1 -eq "-http"
then
  echo -e "\u2328 Setting HTTP-proxy"
  echo "http_proxy=$2" >> $GLOBAL_ENVIRON
  exit 0
fi

if test $1 -eq "-https"
then
  echo -e "\u2328 Setting HTTPS-proxy"
  echo "https_proxy=$2" >> $GLOBAL_ENVIRON
  exit 0
fi
