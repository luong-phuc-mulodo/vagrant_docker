# vagrant_docker

Example using docker (version 1.7.1) as provision of vagrant

## Requirement

### Install Vagrant : https://www.vagrantup.com/downloads.html
### Install VirtualBox : https://www.virtualbox.org/wiki/Downloads
- VirtualBox 5.1.20 platform packages
- VirtualBox 5.1.20 Oracle VM VirtualBox Extension Pack

### Stop port 3306 from PC or comment share port from Vagrantfile ( line 25 )

```
# config.vm.network "forwarded_port", guest: 3306, host_ip: "127.0.0.1", host: 3306
```

## Run

```
vagrant plugin install vagrant-docker-compose
vagrant up
echo "127.0.0.1 app_php.local"
```

open http://app_php.local
