#!/bin/bash
###################################################################
#Script Name  : createbootabledevice.sh
#Description  : Creates bootable temporary device for the given image.
#Args         : 1. ISO file
#               2. Temporary device
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if test "$(id -u -n)" != "root"
    then
    echo -e  "\u2715 Missing root privileges..."
    exit 1
fi

if test $# -ne 2
then
  echo -e  "\u2715 Missing arguments"
fi

echo -e "\u2328 Unmounting $2"
umount "$2"

echo -e "\u2328 Creating partition table"
parted -s /dev/sdb mklabel msdos

echo -e "\u2328 Creating ext4 file system"
echo -ne '\n' | mkfs.ext4 -c -y "$2"

echo -e "\u2328 Creating bootable temporary device with $1 on $2"
dd if="$1"  of="$2" bs=1M status=progress && sync && echo -e "\u2714 Done"; exit 0 | echo -e "\u2715 Failed!"; exit 1
