#!/bin/bash
###################################################################
#Script Name  : rmspace.sh
#Description  : Removes whitespaces from the given file.
#Args         : None
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################


cat "$1" | grep -v ^$