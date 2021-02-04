#!/bin/bash
###################################################################
#Script Name  : removetimestamp.sh
#Description  : Removes the timestamp for the given file.
#Args         : 1. Desired file
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if [ $# != 1 ]
then
  echo -e  "\u2715 Missing root privileges..."
  exit 1
fi

touch -d "2000-01-01 12:00:00" "$1"
echo -e "\u2714 Timestamp of $1 changed."
exit 0
