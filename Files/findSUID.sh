#!/bin/bash
###################################################################
#Script Name  : findSUID.sh
#Description  : Searches for files with .
#Args         : None
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if test $(id -u -n) != "root"
    then
    echo -e  "\u2715 Missing root privileges..."
    exit 1
fi

startTime=$SECONDS

echo -e "\u2328 Searching for SUID-bits in / ..."

for i in `find / -user root -perm -4000 -print 2>/dev/null`
do
  echo -e "\u2714 Found SUID $i"
done

duration=$(( SECONDS - start ))
echo -e "\u2328 Done within $duration seconds"
