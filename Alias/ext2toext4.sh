#!/bin/bash
###################################################################
#Script Name  : ext2toext4.sh
#Description  : Migrates a ext2 filesystem to ext4.
#Args         : EXT2 filesystem which is supposed to be appended after the alias.
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
alias ext2toext4="tune2fs -O extents,uninit_bg,dir_index,has_journal"