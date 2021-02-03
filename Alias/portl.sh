#!/bin/bash
###################################################################
#Script Name  : portl.sh
#Description  : Displays ports in the LISTEN state.
#Args         : None
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
alias portl='netstat -an | grep LISTEN'