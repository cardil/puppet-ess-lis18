Vagrant.configure('2') do |config|
  config.vm.define :master do |c|
    c.vm.box = 'bento/centos-7.4'
    c.vm.network :private_network, ip: '192.168.50.2'
    c.vm.hostname = 'master.home'
    c.vm.provider :virtualbox do |v|
      v.memory = 2048
      v.cpus   = 1
    end
    c.vm.provision :shell,
      path: 'scripts/run-puppeter.bash',
      args: ['answers/master.yaml']
    c.vm.provision :shell,
      path: 'scripts/setup-master.bash'
    c.vm.provision :shell,
      inline: 'puppet agent -t || test $? -eq 2'
  end

  config.vm.define :agent1 do |c|
    c.vm.box = 'bento/ubuntu-18.04'
    c.vm.network :private_network, ip: '192.168.50.3'
    c.vm.hostname = 'agent1.home'
    c.vm.provision :shell,
      path: 'scripts/run-puppeter.bash',
      args: ['answers/agent.yaml']
    c.vm.provision :shell,
      inline: 'puppet agent -t || test $? -eq 2'
  end
end
