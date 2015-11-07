# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  # Port forwarding
  config.vm.network "forwarded_port", guest: 80, host: 3000

  # Provisioning
  config.vm.provision "shell", path: "config/vagrant-dependencies.sh"
  config.vm.provision "shell", path: "config/install-ruby.sh", privileged: false
  config.vm.provision "shell", inline: <<-SHELL
    sudo rm /etc/nginx/sites-enabled/default 
    sudo ln -s /vagrant/config/nginx.conf /etc/nginx/sites-enabled/default
    cd /vagrant
    bundle exec unicorn -c config/unicorn.rb -D
    sudo service nginx restart
  SHELL

  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end


end
