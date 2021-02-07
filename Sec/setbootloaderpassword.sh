#!/bin/bash
###################################################################
#Script Name  : setbootloaderpassword.sh
#Description  : Sets password for the bootloader.
#Args         : None
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if test `id -u` -ne 0
then
  echo -e "[\u2715] Missing privileges..."
  exit 1
fi

echo -e "\u2328 Setting grub2 password"
grub2-setpassword

echo -e "\u2328 Updating grub configuration"
sed -i s/root/bootuser/g /etc/grub.d/01_users

echo -e "\u2328 Regenerate grub configuration"
grub2-mkconfig -o /boot/grub2/grub.cfg