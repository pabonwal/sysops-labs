Vagrant.configure(2) do |config|

    config.vm.define "master" do |master|
        master.vm.box = "ubuntu/jammy64"
        master.vm.provider "virtualbox" do |v|
            v.memory = 1024
            v.cpus = 1
        end
        master.vm.hostname = "master"
        master.vm.network "public_network", ip: "192.168.1.10"
        master.vm.provision "ansible" do |ansible|
            ansible.playbook = "playbooks/master.yml"
        end
    end

    config.vm.define "worker1" do |worker1|
        worker1.vm.box = "ubuntu/jammy64"
        worker1.vm.provider "virtualbox" do |v|
            v.memory = 1024
            v.cpus = 1
        end
        worker1.vm.hostname = "worker1"
        worker1.vm.network "public_network", ip: "192.168.1.11"
        worker1.vm.provision "ansible" do |ansible|
            ansible.playbook = "playbooks/worker.yml"
        end
    end

    config.vm.define "worker2" do |worker2|
        worker2.vm.box = "ubuntu/jammy64"
        worker2.vm.provider "virtualbox" do |v|
            v.memory = 1024
            v.cpus = 1
        end
        worker2.vm.hostname = "worker2"
        worker2.vm.network "public_network", ip: "192.168.1.12"
        worker2.vm.provision "ansible" do |ansible|
            ansible.playbook = "playbooks/worker.yml"
        end
    end

    config.vm.define "worker3" do |worker3|
        worker3.vm.box = "ubuntu/jammy64"
        worker3.vm.provider "virtualbox" do |v|
            v.memory = 1024
            v.cpus = 1
        end
        worker3.vm.hostname = "worker3"
        worker3.vm.network "public_network", ip: "192.168.1.13"
        worker3.vm.provision "ansible" do |ansible|
            ansible.playbook = "playbooks/worker.yml"
        end
    end

end
