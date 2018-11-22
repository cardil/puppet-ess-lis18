Vagrant.configure("2") do |config|

  config.vm.define :centos do |c|
    c.vm.box = 'bento/centos-7.3'
    c.vm.network "private_network", ip: '192.168.50.2'
    c.vm.hostname = 'master'
    c.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus   = 1
    end
    c.vm.provision "file",
      source: "./master-answers.yml",
      destination: "/etc/puppeter-answers.yml"
  end

  config.vm.define :ubuntu do |u|
    u.vm.box = 'bento/ubuntu-18.04'
    u.vm.network "private_network", ip: '192.168.50.3'
    u.vm.hostname = 'agent'
    u.vm.provision "file",
      source: "./agent-answers.yml",
      destination: "/etc/puppeter-answers.yml"
  end

  config.vm.provision "shell", path: "scripts/install-puppet.bash"
end
