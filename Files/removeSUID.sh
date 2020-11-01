#!/bin/bash
###################################################################
#Script Name  : removeSUID.sh
#Description  : Removes the SUID-bit for the given directory.
#Args         : 1. Directory
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if test $(id -u -n) != "root"
    then
    echo -e  "\u2715 Missing root privileges..."
    exit 1
fi

startTime=$SECONDS

echo "\u2328 Searching for SUID-bits in / ..."

for i in `find $1 -user root -perm -4000 -print 2>/dev/null`
do
  echo -e "\u2328 Found SUID-bit $i"
  chmod u-s $i
  if [ $? != 0 ]
  then
    echo -e "\u2714 Successfuly removed SUID on $i"
  else
    echo -e "\u2715 Failed removing SUID on $i"
  fi
done

duration=$(( SECONDS - start ))
echo "\u2328 Duration $duration seconds"
