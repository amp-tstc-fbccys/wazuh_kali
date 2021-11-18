#!/bin/bash
echo "Ener new hostname"
read newhost
echo $newhost
sudo cp /etc/hosts /etc/hosts.bak
sudo sed s/kali/$newhost /etc/hosts | sudo tee /etc/hosts.cys
sudo cp /etc/hosts.cys /etc/hosts
sudo cp /etc/hostname /etc/hostname.bak
sudo sed s/kali/$newhost /etc/hostname | sudo tee /etc/hostname.cys
sudo cp /etc/hostname/cys /etc/hostname
