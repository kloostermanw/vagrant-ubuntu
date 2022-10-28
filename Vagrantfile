# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = 'bento/ubuntu-20.04'
    config.vm.provider "virtualbox"

    if Vagrant.has_plugin?("vagrant-vbguest")
        config.vbguest.auto_update = false
    end

    # Application server
    config.vm.define "ubuntu", primary: true do |node|
        node.vm.hostname = "ubuntu"

        node.vm.network "private_network", ip: "192.168.33.27"

        # VM specific memory and CPU settings.
        node.vm.provider "virtualbox" do |node_virtualbox|
            node_virtualbox.memory = 1024
            node_virtualbox.cpus = 1
        end

        # Ansible folder.
        node.vm.synced_folder "ansible", "/vagrant"

        # tools folder
        config.vm.synced_folder "tools", "/opt/tools", type: "nfs"

        # tools folder
        config.vm.synced_folder "../../.ssh", "/opt/tools/keys", type: "nfs"

        # Run Ansible from the Vagrant VM
        node.vm.provision "ansible_local" do |ansible|
            ansible.playbook = "playbook.yml"
        end

        node.vm.provision :shell, :inline => "sudo -u vagrant /opt/tools/updates/prepare.sh", run: "always"
    end
end
