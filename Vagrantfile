Vagrant.configure("2") do |config|

  config.vm.provision "shell", path: "scripts/install-puppet.bash"

  config.vm.define :centos do |c|
    c.vm.box = 'bento/centos-7.3'
    c.vm.network "private_network", ip: '192.168.50.2'
    c.vm.hostname = 'master'
    c.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus   = 1
    end
  end

  config.vm.define :ubuntu do |u|
    u.vm.box = 'bento/ubuntu-18.04'
    u.vm.network "private_network", ip: '192.168.50.3'
    u.vm.hostname = 'agent'
  end
end
