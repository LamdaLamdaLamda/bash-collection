#!/bin/bash
###################################################################
#Script Name  : remoteshellserver.sh
#Description  : Creates server who serves a remote shell on the given port.
#Args         : 1. Port
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
ncat -v -l -p "$1" -e /bin/bash
