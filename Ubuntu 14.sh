#/bin/bash
wget http://repo.zabbix.com/zabbix/3.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.0-1+trusty_all.deb

sudo dpkg -i zabbix-release_3.0-1+trusty_all.deb

sudo apt update

sudo apt-get install zabbix-agent

sudo echo "Server=10.5.2.30"  >> /etc/zabbix/zabbix_agentd.conf
sudo echo "Hostname=noczabbixserver" >> /etc/zabbix/zabbix_agentd.conf
sudo echo "UserParameter=computer.linux.usercount,free -m | grep "Mem:" | awk  '{ print ($4/1024) ;}'" >> /etc/zabbix/zabbix_agentd.conf
#sudo echo "UserParameter=computer.linux.Root_dir_Free_space,df -h | grep "/dev/nvme2n1p1" | awk '{ print $4 }'"  |  tr -d 'G' >> /etc/zabbix/zabbix_agentd.conf
sudo /etc/init.d/zabbix-agent restart
