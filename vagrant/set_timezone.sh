#!/bin/bash
echo 'SETUP TIMEZONE'
cp /usr/share/zoneinfo/Japan /etc/localtime
sh -c "echo 'ZONE=\"Asia/Tokyo\"' > /etc/sysconfig/clock"
yum install -y ntpdate.x86_64
ntpdate ntp.nict.jp
