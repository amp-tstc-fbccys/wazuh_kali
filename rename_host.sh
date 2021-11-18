#!/bin/bash
echo "Enter new hostname"
read newhost
echo $newhost
cp /etc/hosts /etc/hosts.bak
sed s/kali/$newhost/ /etc/hosts > tee /etc/hosts.cys
cp /etc/hosts.cys /etc/hosts
cp /etc/hostname /etc/hostname.bak
sed s/kali/$newhost /etc/hostname > /etc/hostname.cys
cp /etc/hostname/cys /etc/hostname
