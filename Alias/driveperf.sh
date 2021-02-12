#!/bin/bash
###################################################################
#Script Name  : driveperf.sh
#Description  : Quantifies the drive performance.
#Args         : None
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
alias backupmbr="dd if=/dev/zero of=drive_perf bs=64k count=16k conv=fdatasync"