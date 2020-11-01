#!/bin/bash
###################################################################
#Script Name  : removetimestamps.sh
#Description  : Changes the timestamp of a directory recursively.
#Args         : 1. Desired directory
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################

function changetimestamp
{

  for i in $1/*
  do
    if [ -d $i ]
    then
      touch -d "2000-01-01 12:00:00" $i
      echo -e "\u2714 Timestamp of $i directory changed."
      changetimestamp $i
    else
      touch -d "2000-01-01 12:00:00" $i
      echo -e "\u2714 Timestamp of $i changed."
    fi
  done
}

#########################################
if test $(id -u -n) != "root"
    then
    echo -e  "\u2715 Missing root privileges..."
    exit 1
fi

echo -e "\u2328 Changing timestamps of $1 recursively."
changetimestamp $1
exit 0
