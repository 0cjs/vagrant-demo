Vagrant.configure('2') { |c|
    c.vm.box = 'boxcutter/centos67'
    # Don't actually run setup without saving authorized_hosts first.
    c.vm.provision 'file',
        source: '~/.home/public', destination: '~/.home/public'
}

# Bug notes:
#   Vagrant 1.8.5 has at least one (perhaps more) bug in the code it uses
#   to replace the standard insecure key with a locally generated one.
#   The current workaround is to disable the replacement with:
#       c.ssh.insert_key = false
# Notes:
#   Full docs at https://docs.vagrantup.com
#   Argument to configure() is configuration version, always '2'.
#   Search for boxes at https://atlas.hashicorp.com/search.
#   Map ports with
#       c.vm.network 'forwarded_port', guest: 80, host: 8080
#   Set up private network or public one (usually with a bridge):
#       c.vm.network 'private_network', ip: '192.168.33.10'
#       c.vm.network 'public_network'
#   Share an additional folder to the guest VM (host path, guest path, opts):
#       c.vm.synced_folder '../data', '/vagrant_data'
#   Sample provider-specific options:
#       c.vm.provider 'virtualbox' { |vb|
#           vb.gui = true
#           vb.memory = '1024'
#       }
#   Sample provisioning:
#       c.vm.provision 'shell', inline: <<-SHELL
#           apt-get update
#           apt-get install -y apache2
#       SHELL
