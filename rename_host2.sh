#!/bin/bash
echo "current hostname is"
hostname
echo "Enter new hostname"
read newhostname
#echo $newhostname

cp /etc/hosts /etc/hosts.bak
cp /etc/hostname /etc/hostname.bak
if [ -f /etc/hosts.cys ]
then rm /etc/hosts.cys
fi
#egrep Kali*-? /etc/hosts
#egrep Kali*-? /etc/hosts | wc -l
if [ `egrep Kali*-? /etc/hosts | wc -l` -eq '1' ]
then
echo "new hostname format found. update value to $newhostname"
sed s/'Kali[[:alpha:]]*[[:digit:]]*-[[:digit:]]*'/$newhostname/ /etc/hosts > /etc/hosts.cys
#cat /etc/hosts.cys
else
echo "old name found. replacing with $newhostname"
sed s/kali/$newhostname/ /etc/hosts > /etc/hosts.cys
fi
if [ -f /etc/hosts.cys ]
then
cp /etc/hosts.cys /etc/hosts
else
echo "error: hosts file was not changed"
fi
echo $newhostname > /etc/hostname
echo "Reboot to apply the new hostname before provisioning Wazuh"
