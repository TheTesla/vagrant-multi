# -*- mode: ruby -*-
# vi: set ft=ruby :

#BOX_IMAGE = "ubuntu/bionic64"
#BOX_IMAGE = "generic/ubuntu1804"
BOX_IMAGE = "debian/stretch64"
NODE_COUNT = 3

Vagrant.configure("2") do |config|
  config.vm.define "master" do |subconfig|
    subconfig.vm.provider "virtualbox" do |v|
      v.cpus = 3
      v.memory = 4096
    end
    subconfig.vm.box = BOX_IMAGE
    subconfig.disksize.size = '42G'
    subconfig.vm.hostname = "master"
    subconfig.vm.network :private_network, ip: "10.0.0.10", virtualbox__intnet: "mynetwork"
  end
  
  (1..NODE_COUNT).each do |i|
    config.vm.define "node#{i}" do |subconfig|
      subconfig.vm.provider "virtualbox" do |v|
        v.cpus = 1
        v.memory = 2048
      end
      subconfig.vm.box = BOX_IMAGE
      subconfig.disksize.size = '23G'
      subconfig.vm.hostname = "node#{i}"
      #subconfig.vm.network :private_network, ip: "10.0.0.#{i + 10}", virtualbox__intnet: "mynetwork"
      subconfig.vm.network :private_network, type: "dhcp", virtualbox__intnet: "mynetwork"
    end
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt install -y python
  SHELL
end

