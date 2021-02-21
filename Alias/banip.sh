#!/bin/bash
###################################################################
#Script Name  : banip.sh
#Description  : Bans given IP address by using the fail2ban-client.
#Args         : IP is supposed to be appended after the alias.
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
alias banip="fail2ban-client set sshd banip"