#!/bin/bash
###################################################################
#Script Name  : setupsh.sh
#Description  : Moves the given shell script to a directory of the interpreter.
#Args         : 1. Shellscript with .sh file extension
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if test $(id -u -n) != "root"
    then
    echo -e  "\u2715 Missing root privileges..."
    exit 1
fi

DEST="/usr/local/bin"
SHELL_SCRIPT=`echo $1 | cut -d "." -f1`

echo -e "\u2328 Copying $1 to $1 ..."
cp $1 /bin/

if test $? -eq 0
then
  echo -e "\u2714 Successfully copied $1 to $DEST ..."
  echo -e "\u2328 Removing the file extension..."
  mv /bin/$1 $DEST/$SHELL_SCRIPT
  echo -e "\u2328 Setting execution bit..."
  chmod +x $DEST/$SHELL_SCRIPT
  if test $? -eq 0
  then
    echo -e "\u2714 $SHELL_SCRIPT is now executable..."
    exit 0
  else
    echo -e "\u2715 Error! Setting X-bit failed..."
    echo -e "\u2715 Exiting..."
    exit 1
  fi
else
  echo -e "\u2715 Error! Copy process failed..."
  exit 1
fi
