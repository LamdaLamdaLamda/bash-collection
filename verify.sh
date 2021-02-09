#!/bin/bash
###################################################################
#Script Name    : verify.sh
#Description    : Determines whether the repository contains valid shellscripts or not.
#               : Returns 1 when any shellcheck failed, otherwise 0.
#               : Some shellcheck metrics are excluded:
#               :     SC2216 - Piping to 'rm', a command that doesn't read stdin.
#               :              See: https://github.com/koalaman/shellcheck/wiki/SC2216
#               :     SC2044 - For loops over find output are fragile.
#               :              See: https://github.com/koalaman/shellcheck/wiki/SC2044
#               :     SC2039 - In POSIX sh, something is undefined. Bash as interpreter is used.
#               :              See: https://github.com/koalaman/shellcheck/wiki/SC2039
#               :     SC2112 - 'function' keyword is non-standard. Bash as interpreter is used.
#               :              See: https://github.com/koalaman/shellcheck/wiki/SC2112
#               :     SC2002 - Useless cat. Consider 'cmd < file | ..' or 'cmd file | ..' instead. 
#               :              See: https://github.com/koalaman/shellcheck/wiki/SC2002
#               :     SC2010 - Don't use ls | grep. Use a glob or a for loop with a condition to allow non-alphanumeric filenames.
#               :              See: https://github.com/koalaman/shellcheck/wiki/SC2010
#               :     SC2129 - Consider using { cmd1; cmd2; } >> file instead of individual redirects.
#               :              See: https://github.com/koalaman/shellcheck/wiki/SC2129
#               :
#Args           : None
#Author         : LamdaLamdaLamda
#Email          : 25778959+LamdaLamdaLamda@users.noreply.github.com
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
    echo -e "[\u2715] Verification failed."
    exit 1
else
    echo -e "[\u2714] Verification suceed."
    exit 0
fi




