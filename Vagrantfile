# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  # The box
  config.vm.box = "puppetlabs/ubuntu-14.04-64-nocm"

  # port forwarding to view the hello world application
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 5000, host: 5050 

  # doing standard apt-get update and upgrade
   config.vm.provision "shell", inline: <<-SHELL
     sudo apt-get update -y
     sudo apt-get upgrade  -y
   SHELL
   
  # copying over my flask app	 
  config.vm.provision "file",
  	source: "flask_app.py",
  	destination: "flask_app.py"
  
  # my chef recipe to install nginx,flas and chef.
  # Chef is automatically installed by Vagrant.
  config.vm.provision "chef_solo" do |chef|
  	chef.add_recipe "configure_it"
  end
  
  # This contains checks for admin and vagrant
  # privileges.
  config.vm.provision "shell",
  	path: "shell_provisioner.sh"

   
  config.vm.provision "file",
  	source: ".inputrc",
  	destination: ".inputrc"


  config.vm.provision "file",
  	source: "vimrc",
  	destination: ".vimrc"
end
