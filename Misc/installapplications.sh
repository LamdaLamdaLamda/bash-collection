#!/bin/bash
###################################################################
#Script Name  : installapplications.sh
#Description  : Installs the given applications via aptitude when put into then
#               declared array  .
#Args         : None
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if test $(id -u -n) != "root"
    then
    echo -e  "\u2715 Missing root privileges..."
    exit 1
fi

trap 'echo -e "\u2328  Installation cant be interrupted"' 1 2 3 9 15
declare -a appList=( "build-essential"
                     "gcc"
                     "sdad"
                   )

function install
{
   echo -e "\u2328  Installing $1"
   apt-get install -y $1 >/dev/null 2>&1

   if test $? -eq 0
   then
     echo -e "\u2713 $1 installed"
   else
     echo -e "\u2715 $1 installation failed"
   fi
}

for i in "${appList[@]}"
do
  install $i
done

exit 0
