#!/bin/bash
echo 'INSTALL JAVA'
cd /home/vagrant
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.tar.gz
tar -xzf jdk-8u112-linux-x64.tar.gz
cd /home/vagrant/jdk1.8.0_112
alternatives --install /usr/bin/java java /home/vagrant/jdk1.8.0_112/bin/java 2
alternatives --config java <<< '1'
sh -c 'echo "export JAVA_HOME=/home/vagrant/jdk1.8.0_112" >> /home/vagrant/.bash_profile'
sh -c 'echo "export JRE_HOME=/home/vagrant/jdk1.8.0_112/jre" >> /home/vagrant/.bash_profile'
sh -c 'echo "export PATH=$PATH:/home/vagrant/jdk1.8.0_112/bin:/home/vagrant/jdk1.8.0_112/jre/bin" >> /home/vagrant/.bash_profile'
source /home/vagrant/.bash_profile
cd ../
rm -rf jdk-8u112-linux-x64.tar.gz
