#!/bin/bash
echo 'CREATE KEY'
source /home/vagrant/.bash_profile
cd /vagrant
if [ "$(ls | grep 'keystore.p12')" != "keystore.p12" ]; then
keytool -genkey -alias tomcat \
-storetype PKCS12 -keyalg RSA -keysize 2048 \
-keystore keystore.p12 -validity 3650 << EOF
123456
123456
vagrant
vagrant
Company
Tokyo


y
EOF

chown -R vagrant:vagrant keystore.p12
fi
