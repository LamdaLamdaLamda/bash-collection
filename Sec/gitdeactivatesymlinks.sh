#!/bin/bash
###################################################################
#Script Name  : gitdeactivatesymlinks.sh
#Description  : Deactivates sym-link support for git to prevent
#             : to be vulnerable for CVE-2021-21300. 
#Args         : None
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
git config --global core.symlinks false