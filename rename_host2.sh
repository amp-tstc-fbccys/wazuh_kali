#!/bin/bash
echo "Enter new hostname"
read newhost
#echo $newhost

cp /etc/hosts /etc/hosts.bak
cp /etc/hostname /etc/hostname.bak
rm /etc/hosts.cys
#egrep Kali*-? /etc/hosts
#egrep Kali*-? /etc/hosts | wc -l
if [ `egrep Kali*-? /etc/hosts | wc -l` -eq '1' ]
then
echo "new hostname format found. correcting"
echo $newhost
sed s/'Kali[[:alpha:]]*[[:digit:]]*-[[:digit:]]*'/$newhost/ /etc/hosts > /etc/hosts.cys
#cat /etc/hosts.cys
else
echo "old name found. replacing"
sed s/kali/$newhost/ /etc/hosts > /etc/hosts.cys
fi
if [ -f /etc/hosts.cys ]
then
cp /etc/hosts.cys /etc/hosts
else
echo "error: hosts file was not changed"
fi
echo $newhost > /etc/hostname
echo "Reboot to apply the new hostname before provisioning Wazuh"
