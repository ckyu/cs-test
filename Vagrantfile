# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder ".", "/opt/patient_card", owner: "vagrant", group: "vagrant"

  # Port forwarding
  config.vm.network "forwarded_port", guest: 80, host: 3000

  # Provisioning
  config.vm.provision "shell", path: "config/vagrant-dependencies.sh"
  config.vm.provision "shell", path: "config/install-ruby.sh", privileged: false
  config.vm.provision "shell", inline: <<-SHELL
    sudo rm /etc/nginx/sites-enabled/default 
    sudo ln -s /opt/patient_card/config/nginx.conf /etc/nginx/sites-enabled/default
    cd /opt/patient_card
    /home/vagrant/.rbenv/shims/rake setup:bootstrap    
    /home/vagrant/.rbenv/shims/bundle exec unicorn -c config/unicorn.rb -D
    sudo service nginx restart
  SHELL


end
