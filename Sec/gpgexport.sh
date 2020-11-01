#!/bin/bash
###################################################################
#Script Name  : gpgexport.sh
#Description  : Exports the public key by creating a *.asc file.
#Args         : 1.Username
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
OUTPUTFILE="$1-pub-sub.asc"

echo -e "\u2328 Generating GPG public key export for $1"
gpg --armor --output $OUTPUTFILE  --export $1

if test $? -eq 0
then
  cat $OUTPUTFILE
else
  echo -e "\u2715 Unable to open $OUTPUTFILE"
  exit 1
fi
