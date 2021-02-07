#!/bin/bash
###################################################################
#Script Name  : encryptswap.sh
#Description  : Encrypts the swap partition.
#Args         : 1.Parameter - The swap area as /dev/sdX
#             : 2.Parameter - The UUID.
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if test "$(id -u)" -ne 0
then
  echo -e "[\u2715] Missing privileges..."
  exit 1
fi

SWAP_PARTITION="$1"
FSTAB_ENTRY="UUID=$2 none swap defaults 0 0"
FSTAB_ENTRY_ENCRYPT="/dev/mapper/swap none swap defaults 0 0"

echo -e "\u2328 Disabling SWAP."
swapoff -a

echo -e "\u2328 Wiping SWAP"
shred -vfz -n 10 "$SWAP_PARTITION"

echo -e "\u2328 Updating fstab"
echo "$FSTAB_ENTRY" >> /etc/fstab


echo -e "\u2328 Adding swap to /etc/crypttab"
swap "$SWAP_PARTITION" /dev/urandom swap

echo -e "\u2328 Starting crypt-mapping"
cryptdisks_start swap
/etc/init.d/cryptdisks restart

echo -e "\u2328 Adding ecrypted swap to /etc/fstab"
echo "$FSTAB_ENTRY_ENCRYPT" >> /etc/fstab

echo -e "\u2328 Activating swap"
swapon -a