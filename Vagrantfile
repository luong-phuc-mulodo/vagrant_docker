# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at http://www.vagrantbox.es/
  config.vm.box = "CentOS_70"
  config.vm.box_url = "https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.1.0/centos-7.0-x86_64.box"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host_ip: "127.0.0.1", host: 8080
  config.vm.network "forwarded_port", guest: 3306, host_ip: "127.0.0.1", host: 3306

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder ".", "/vagrant", mount_options: ['dmode=777','fmode=777']

  config.vm.provider "virtualbox" do |vb|
    vb.name = "vagrant_docker"
  end

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
  end

  ##################################
  # Inline shell setup
  ##################################
  config.vm.provision "shell", inline: <<-SHELL

echo 'UPDATE YUM'
timedatectl set-timezone Asia/Tokyo
yum update -y
yum upgrade -y
yum install -y wget

echo 'SETUP TIMEZONE'
cp /usr/share/zoneinfo/Japan /etc/localtime
sh -c "echo 'ZONE=\"Asia/Tokyo\"' > /etc/sysconfig/clock"
yum install -y ntpdate.x86_64
ntpdate ntp.nict.jp

echo 'DISABLE FIREWALL'
systemctl stop firewalld

echo 'INSTALL MYSQL CLIENT'
yum install -y mysql
  SHELL

  config.vm.provision "docker"
  config.vm.provision "docker_compose", yml: "/vagrant/docker-compose.yml", run: "always"
end
