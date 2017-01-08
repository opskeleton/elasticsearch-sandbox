# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define :elasticsearch do |node|
    bridge = ENV['VAGRANT_BRIDGE']
    bridge ||= 'eth0'

    env  = ENV['PUPPET_ENV']
    env ||= 'dev'

    node.vm.box = 'ubuntu-16.04_puppet-3.8.7' 
    node.vm.network :public_network, :bridge => bridge
    node.vm.hostname = 'elasticsearch.local'
  
    node.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 2]
    end

    node.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'manifests'
      puppet.manifest_file  = 'default.pp'
      puppet.options = "--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera_vagrant.yaml --environment=#{env}"
    end
  end

end
