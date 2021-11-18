#!/bin/bash
cp /var/ossec/etc/ossec.conf /var/ossec/etc/ossec.conf.bak
sed s/MANAGER_IP/'172.17.220.69'/ /var/ossec/etc/ossec.conf > /var/ossec/etc/ossec.conf.cys
cp /var/ossec/etc/ossec.conf.cys /var/ossec/etc/ossec.conf
cd /var/ossec/bin
./agent-auth -m 172.17.220.69
systemctl daemon-reload
systemctl enable wazuh-agent
systemctl start wazuh-agent
