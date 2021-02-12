#!/bin/bash
###################################################################
#Script Name  : backupmbr.sh
#Description  : Backups the MBR.
#Args         : None
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
alias backupmbr="dd if=/dev/sda of=mbr.bak bs=512 count=1"
