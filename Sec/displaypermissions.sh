#!/bin/bash
###################################################################
#Script Name  : displaypermissions.sh
#Description  : Searches for file with specific file attributes: SUID, SGID
#               World-Writable-Files, No-Owner.
#Args         : None
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if test "$(id -u)" -ne 0
then
  echo -e "[\u2715] Missing privileges..."
  exit 1
fi

echo -e "\u2328 Searching for SUID files"
find / -perm -4000
echo "-----------"

echo -e "\u2328 Searching for SGID files"
find / -perm -2000
echo "-----------"

echo -e "\u2328 Searching for World writable-files"
find / -xdev -type d \( -perm -0002 -a ! -perm -1000 \) -print
echo "-----------"

echo -e "\u2328 Searching for No-Owner files"
find / -xdev \( -nouser -o -nogroup \) -print
echo -e  "-----------"
