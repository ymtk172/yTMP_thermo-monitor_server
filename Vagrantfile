Vagrant.configure("2") do |config|
# Proxy
#  config.proxy.http     = "http://proxy:port"
#  config.proxy.https    = "http://proxy:port"
#  config.proxy.no_proxy = "localhost,127.0.0.1"
# OS
  config.vm.box = "centos/7"
  config.vm.network "private_network", ip: "192.168.250.250"
  config.ssh.insert_key = false
# sync folder
#  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  config.vm.synced_folder "./postgresql", "/home/vagrant/postgresql", owner: "vagrant", group: "vagrant"
  config.vm.synced_folder "./redis", "/home/vagrant/redis", owner: "vagrant", group: "vagrant"
# Port forwarding
  config.vm.network "forwarded_port", guest: 5432, host: 5432
  config.vm.network "forwarded_port", guest: 6379, host: 6379
# Spec
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "384"
    vb.cpus = "1"
  end
# Username
  config.ssh.username = "vagrant"
# Provisioning
  config.vm.provision :shell, :path => "init_script.sh"
end
