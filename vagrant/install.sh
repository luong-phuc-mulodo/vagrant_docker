#!/bin/bash
cd /vagrant
sh vagrant/update_yum.sh
sh vagrant/disable_firewall.sh
#sh vagrant/install_java.sh
#sh vagrant/generate_key.sh
#sh vagrant/install_mysql.sh
#sh vagrant/set_timezone.sh
#sh vagrant/docker.sh
