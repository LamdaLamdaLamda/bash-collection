#!/bin/bash
###################################################################
#Script Name  : unbanip.sh
#Description  : Unbans given IP address by using the fail2ban-client.
#Args         : IP is supposed to be appended after the alias.
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
alias unbanip="fail2ban-client set sshd unbanip"