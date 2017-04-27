#!/bin/bash
# --- MySQL 5.6.*(http://ips.nekotype.com/3420/)
echo 'INSTALL MYSQL'
cd /home/vagrant
wget http://repo.mysql.com/mysql-community-release-el6-5.noarch.rpm
rpm -ivh mysql-community-release-el6-5.noarch.rpm
yum install -y mysql-server
# --- Date -> MySQL date config
sed "s/\[mysqld\]/[mysqld]\ndefault-time-zone='+9:00'/" /etc/my.cnf -i
/etc/init.d/mysqld start

mysql -uroot < /vagrant/vagrant/script.sql
