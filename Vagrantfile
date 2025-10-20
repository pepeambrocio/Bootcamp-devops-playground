Vagrant.configure(2) do |config|
  config.vm.define "ubuntu-server" do |server|
    server.vm.box = "bento/ubuntu-24.04"
    server.vm.hostname = "ubuntu-server"
    server.vm.network "private_network", ip:"192.168.33.10"
    server.vm.provider "virtualbox" do |vm|
    	vm.name = "ubuntu-server"
       	vm.gui = false
       	vm.memory = 1024
    end 
  end

  config.vm.define "ubuntu-client" do |client|
    client.vm.box = "bento/ubuntu-24.04"
    client.vm.hostname = "ubuntu-client"
    client.vm.network "private_network", ip:"192.168.33.20"
    client.vm.provider "virtualbox" do |vm|
        vm.name = "ubuntu-client"
        vm.gui = false
        vm.memory = 1024
    end
  end

  config.vm.provision "shell", inline: <<-SHELL
    useradd -m -p "$(openssl passwd -6 user1)" -s /bin/bash user1
  SHELL
end
