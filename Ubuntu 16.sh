#/bin/bash
sudo wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.0-1%2Bxenial_all.deb 

sudo apt update

sudo dpkg -i zabbix-release_5.0-1+xenial_all.deb  

sudo apt update

sudo apt install zabbix-agent

sudo systemctl enable zabbix-agent


sudo echo "Server=10.5.2.30"  >> /etc/zabbix/zabbix_agentd.conf
sudo echo "Hostname=noczabbixserver" >> /etc/zabbix/zabbix_agentd.conf
sudo echo "UserParameter=computer.linux.usercount,free -m | grep "Mem:" | awk  '{ print ($4/1024) ;}'" >> /etc/zabbix/zabbix_agentd.conf
#sudo echo "UserParameter=computer.linux.Root_dir_Free_space,df -h | grep "/dev/nvme2n1p1" | awk '{ print $4 }'"  |  tr -d 'G' >> /etc/zabbix/zabbix_agentd.conf
sudo echo "EnableRemoteCommands=1" >> /etc/zabbix/zabbix_agentd.conf
sudo systemctl restart zabbix-agent
sudo systemctl enable zabbix-agent
