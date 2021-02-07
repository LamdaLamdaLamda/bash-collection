#!/bin/bash
###################################################################
#Script Name  : verify.sh
#Description  : Determines whether the repository contains valid shellscripts or not.
#             : Returns 1 when any shellcheck failed, otherwise 0.
#Args         : None
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
ERROR=false
function verify_directory {
    echo -e "[\u2328] Running shellcheck for $1/"
    for script in "$1"/*.sh; do
        echo -e "[\u2328] Verify --> $script"
        shellcheck --exclude=SC2216,SC2044,SC2039,SC2112,SC2002,SC2010,SC2129 "$script"     
        if test $? != 0
        then
            echo -e "[\u2715] Failed\n"
            ERROR=true
        else 
            echo -e "[\u2714] Success\n"
        fi
    done
}


verify_directory "Files"
verify_directory "Alias"
verify_directory "Misc"
verify_directory "Network"
verify_directory "Sec"


if $ERROR
then
    exit 1
else
    exit 0
fi




