#!/bin/bash
###################################################################
#Script Name  : controlcapslock.sh
#Description  : Activates/deactivates the capslock key. Note that this action
#               will be undone when rebooting.
#Args         : None
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if test $# -eq 0
then
  echo -e "[\u2715] Missing argument..."
  exit 1
fi

if test $1 == "-d"
then
  echo -e "\u2328 Deactivating capslock"
  setxkbmap -option caps:none
fi

if test $1 == "-a"
then
  echo -e "\u2328 Activating capslock"
  setxkbmap -option
fi
exit 0
