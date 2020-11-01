#!/bin/bash
###################################################################
#Script Name  : clearfirefox.sh
#Description  : Clears some firefox information.
#Args         : 1. Username.
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if test $(id -u -n) != "root"
    then
    echo -e  "\u2715 Missing root privileges..."
    exit 1
fi

databasesFirefox=`ls /home/$1/.mozilla/firefox | grep ".default"`
cacheFirefox=`ls /home/$1/.cache/mozilla/firefox/ | grep ".default"`
backupPath="$1/.backup/firefox/backup"

function createBackup() {
  echo -e "\u2328 Creating backup for $1"
  cp -R $1 $backupPath
}

function removeFile() {
  echo -e "\u2328 Removing $1" from $2
  rm -f $1
}

if test $2 = '-b'
then
  mkdir -p $backupPath
  for i in $databasesFirefox
  do
    createBackup /home/$1/.mozilla/firefox/$i
  done

  for i in $cacheFirefox
  do
    createBackup /home/$1/.cache/mozilla/firefox/$i
  done
fi

echo "------"
for i in $databasesFirefox
do
  cd /home/$1/.mozilla/firefox/$i
  removeFile "cookies.sqlite" $i
  removeFile "cookies.sqlite-wal" $i
  removeFile "cookies.sqlite-shm" $i
  removeFile "places.sqlite-wal" $i
  removeFile "places.sqlite-shm" $i
  removeFile "places.sqlite" $i

  echo "------"
done
