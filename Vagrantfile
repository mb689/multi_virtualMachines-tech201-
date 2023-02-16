Vagrant.configure("2") do |config|
  config.vm.define "database" do |database|
    database.vm.box = "ubuntu/bionic64"
    database.vm.network "private_network", ip: "192.168.10.150"

    database.vm.provision "shell", path: "environment/environment/spec-tests/db/provision.sh", privileged: false
    database.vm.synced_folder "environment", "/home/vagrant/environment"
  end

  config.vm.define "app" do |app|
    app.vm.box = "ubuntu/bionic64"
    app.vm.network "private_network", ip: "192.168.10.100"
   
    app.vm.synced_folder "app", "/home/vagrant/app"
    app.vm.provision "shell", path: "app/app/provision.sh", privileged: false
  end
end