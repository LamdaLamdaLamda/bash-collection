#!/bin/bash
###################################################################
#Script Name  : protectbootloaderfiles.sh
#Description  : Changes the ownership and permission  of grub.
#Args         : None
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if test `id -u` -ne 0
then
  echo -e "\u2715 Missing privileges..."
  exit 1
fi

echo -e "\u2328 Setting the ownership and permissions of /etc/grub.conf to root"

if test -e /etc/grub.conf
then
  chown root:root /etc/grub.conf
  chmod og-rwx /etc/grub.conf
else
  echo -e "\u2715 /etc/grub.conf is not present"
  exit 1
fi

echo -e "\u2328 Setting the ownership and permissions of /etc/grub.d to root"

if test -e /etc/grub.d
then
  chown -R root:root /etc/grub.d
  chmod -R og-rwx /etc/grub.d
else
  echo -e "\u2715 /etc/grub.d is not present"
  exit 1
fi
