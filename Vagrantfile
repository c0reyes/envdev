Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"
  config.vm.hostname = "development"

  config.vm.provision :shell, path: "scripts/init.sh"
  config.vm.provision :shell, path: "scripts/docker.sh"
  config.vm.provision :shell, path: "scripts/gitea.sh"
  config.vm.provision :shell, path: "scripts/jenkins.sh"
  config.vm.provision :shell, path: "scripts/minikube.sh"
  config.vm.provision :shell, path: "scripts/motd.sh"

  config.vm.network :forwarded_port, guest: 5000, host: 5000
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 8000, host: 8000
  config.vm.network :forwarded_port, guest: 8080, host: 8080
  config.vm.network :forwarded_port, guest: 2222, host: 2222

  config.vbguest.auto_update = false

  config.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 2
  end

  config.vm.provider "libvirt" do |l|
      l.memory = 4096
      l.cpus = 2
  end
end
