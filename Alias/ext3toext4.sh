#!/bin/bash
###################################################################
#Script Name  : ext3toext4.sh
#Description  : Migrates a ext3 filesystem to ext4.
#Args         : EXT3 filesystem which is supposed to be appended after the alias.
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
alias="tune2fs -O extents,uninit_bg,dir_index"