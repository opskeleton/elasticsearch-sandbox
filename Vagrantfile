# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = 'ubuntu-16.04_puppet-3.8.7'
    config.vm.network :private_network, ip: '192.168.1.201'
    config.vm.hostname = 'elasticsearch.local'
    config.vm.network :forwarded_port, guest: 9300, host: 9300
    config.vm.network :forwarded_port, guest: 9200, host: 9200
end
