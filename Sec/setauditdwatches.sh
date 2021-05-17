#!/bin/bash
###################################################################
#Script Name  : setauditwatches.sh
#Description  : Sets useful audit watches to observe specific activities.
#Args         : None
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if test "$(id -u)" -ne 0
then
  echo -e "[\u2715] Missing privileges..."
  exit 1
fi

echo -e "\u2328 Monitoring cmd-line history"
echo -w /bin -p x -k cmd-line-history >> /etc/audit/rules.d/audit.rules

echo -e "\u2328 Monitoring httpd"
echo -w /etc/httpd/ -p rwa -k httpd-access >> /etc/audit/rules.d/audit.rules

echo -e "\u2328 Monitoring /etc/passwd"
echo -w /etc/passwd -p wa -k passwd >> /etc/audit/rules.d/audit.rules

echo -e "\u2328 Monitoring copy, move, delete and kill operations"
echo -a exit,always -F arch=b64 -S execve -F path=/bin/cp -k Copy >> /etc/audit/rules.d/audit.rules
echo -a exit,always -F arch=b64 -S execve -F path=/bin/mv -k Move_Rename >> /etc/audit/rules.d/audit.rules
echo -a exit,always -F arch=b64 -S execve -F path=/bin/rm -k Delete >> /etc/audit/rules.d/audit.rules
echo -a exit,always -F arch=b64 -S execve -F path=/bin/vi -k VI >> /etc/audit/rules.d/audit.rules

echo -e "\u2328 Monitoring shutdown and reboot opreations"
echo -a exit,always -F arch=b64 -S execve -F path=/sbin/reboot -k Reboot >> /etc/audit/rules.d/audit.rules
echo -a exit,always -F arch=b64 -S execve -F path=/sbin/init -k Init >> /etc/audit/rules.d/audit.rules
echo -a exit,always -F arch=b64 -S execve -F path=/sbin/poweroff -k Poweroff >> /etc/audit/rules.d/audit.rules
echo -a exit,always -F arch=b64 -S execve -F path=/sbin/shutdown -k Shutdown >> /etc/audit/rules.d/audit.rules

echo -e "\u2328 Monitoring mount and umount operations"
echo -a exit,always -F arch=b64 -S execve -F path=/bin/mount -k Mount >> /etc/audit/rules.d/audit.rules
echo -a exit,always -F arch=b64 -S execve -F path=/bin/umount -k Mount >> /etc/audit/rules.d/audit.rules

echo -e "\u2328 Monitoring kill operations"
echo -a exit,always -F arch=b64 -S kill -k Kill >> /etc/audit/rules.d/audit.rules

echo -e "\u2328 Restarting auditd"
systemctl restart auditd.service 

