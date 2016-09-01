Vagrant.configure("2") { |config|
    config.vm.box = "boxcutter/centos72"
}

# Bug notes:
#   Vagrant 1.8.5 has at least one (perhaps more) bug in the code it uses
#   to replace the standard insecure key with a locally generated one.
#   The current workaround is to disable the replacement with:
#       config.ssh.insert_key = false
# Notes:
#   Full docs at https://docs.vagrantup.com
#   Argument to configure() is configuration version, always "2".
#   Search for boxes at https://atlas.hashicorp.com/search.
#   Map ports with
#       config.vm.network "forwarded_port", guest: 80, host: 8080
#   Set up private network or public one (usually with a bridge):
#       config.vm.network "private_network", ip: "192.168.33.10"
#       config.vm.network "public_network"
#   Share an additional folder to the guest VM (host path, guest path, opts):
#       config.vm.synced_folder "../data", "/vagrant_data"
#   Sample provider-specific options:
#       config.vm.provider "virtualbox" { |vb|
#           vb.gui = true
#           vb.memory = "1024"
#       }
#   Sample provisioning:
#       config.vm.provision "shell", inline: <<-SHELL
#           apt-get update
#           apt-get install -y apache2
#       SHELL
