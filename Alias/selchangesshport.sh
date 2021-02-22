#!/bin/bash
###################################################################
#Script Name  : selchangesshport.sh
#Description  : Changes the SSH port policy in SEL to apply SSH port changes.
#Args         : The desired SSH port.
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
alias selchangesshport="semanage port -a -t ssh_port_t -p tcp"