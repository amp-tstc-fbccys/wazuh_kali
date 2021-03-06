#!/bin/bash
echo "Enter new hostname"
read newhost
echo $newhost
cp /etc/hosts /etc/hosts.bak
sed s/kali/$newhost/ /etc/hosts > /etc/hosts.cys
cp /etc/hosts.cys /etc/hosts
cp /etc/hostname /etc/hostname.bak
echo $newhost > /etc/hostname
echo "Reboot to apply the new hostname before provisioning Wazuh"
