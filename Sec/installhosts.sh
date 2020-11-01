#!/bin/bash
###################################################################
#Script Name  : installhost.sh
#Description  : Installs a cron job for refreshing the hosts file daily.
#               Hosts entries are requested from tps://hosts.ubuntu101.co.za
#Args         : None
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if test `id -u` -ne 0
then
  echo -e "[\u2715] Missing privileges..."
  exit 1
fi

echo -e "\u2328 Creating file backup..."
mv /etc/hosts.deny /etc/hosts.deny.back
mv /etc/hosts /etc/hosts.bak

echo -e "\u2328 Installing host entries"
wget https://hosts.ubuntu101.co.za/hosts.deny -O /etc/hosts.deny
wget https://hosts.ubuntu101.co.za/hosts -O /etc/hosts

echo -e "\u2328 Installing host entries"
touch /etc/cron.daily/hosts
echo "#!/bin/bash" >> /etc/cron.daily/hosts
echo "wget https://hosts.ubuntu101.co.za/hosts.deny -O /etc/hosts.deny" >> /etc/cron.daily/hosts
echo "wget https://hosts.ubuntu101.co.za/hosts -O /etc/hosts" >> /etc/cron.daily/hosts
exit 0
