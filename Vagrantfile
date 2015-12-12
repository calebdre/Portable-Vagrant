Vagrant.configure("2") do |config|
  config.vm.network "private_network", ip: "192.168.100.93"
  config.vm.box = "vagrant-ubuntu-trusty-64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.network :forwarded_port, host: 5000, guest: 80
  config.vm.network :forwarded_port, host: 3306, guest: 3306

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path = 'puppet/modules'
    puppet.manifest_file = 'init.pp'
  end
end

