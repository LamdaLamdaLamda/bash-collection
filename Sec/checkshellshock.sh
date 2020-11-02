#!/bin/bash
###################################################################
#Script Name  : checkshellshock.sh
#Description  : Determines whether the shell is vulnerable for shellshock or not.
# Note        : If you see an error or no further output (on top of
#               the existing echo command) you are not vulnerable!
#Args         : None
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
SHELLSHOCK=`env x="() { :;}; echo x" bash -c "" 2>/dev/null`
if test -n "$SHELLSHOCK"
then
	echo -e "\u2715 Vulnerable for Shellshock (CVE-2014-6271)"
else
	echo -e "\u2714 Not vulnerable for Shellshock (CVE-2014-6271)"
fi
exit 0
