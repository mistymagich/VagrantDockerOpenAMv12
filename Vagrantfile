# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.ssh.insert_key = false

  config.vm.box = "coreos-stable"
  config.vm.box_version = ">= 308.0.1"
  config.vm.box_url = "http://stable.release.core-os.net/amd64-usr/current/coreos_production_vagrant.json"
  config.vm.hostname = "openam.example.com"
  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.synced_folder ".", "/vagrant"


  # vagrant-hostmanager
  config.hostmanager.enabled = false
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true
  config.vm.provision "shell", inline: "touch /etc/hosts"
  config.vm.provision :hostmanager

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end


  config.vm.provider :virtualbox do |v|
    v.check_guest_additions = false
    v.functional_vboxsf     = false
    v.memory = 2048
  end

  config.vm.provision "docker" do |d|
    d.build_image "/vagrant",
      args: "-t openam"

    d.run "openam",
      args: "-p 8080:8080 --dns=127.0.0.1"
  end
end
