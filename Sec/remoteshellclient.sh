#!/bin/bash
###################################################################
#Script Name  : remoteshellclient.sh
#Description  : Connects to a reverse shell created through netcat.
#Args         : 1. IP-Address
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
ncat $1 7777
