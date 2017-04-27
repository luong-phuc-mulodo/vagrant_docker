#!/bin/bash
echo 'DISABLE FIREWALL'
service iptables stop
chkconfig iptables off
