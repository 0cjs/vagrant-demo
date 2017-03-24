Vagrant.configure('2') { |c|

    # This configures a single VM named "default"
    # c.vm.box = 'centos/7'

    # Multi-machine configs specify a name for each machine.
    #
    c.vm.define('centos7')   { |c| c.vm.box = 'centos/7' }
    {   centos7:    'centos/7',
        centos6:    'centos/6',
        centos5:    'boxcutter/centos511',
        debian8:    'debian/jessie64',
        debian7:    'debian/wheezy64',
        debian6:    'puppetlabs/debian-6.0.10-64-nocm',
        ubuntu1404: 'ubuntu/trusty64',
        ubuntu1604: 'ubuntu/xenial64',
    }.each { |name, box|
        c.vm.define(name, autostart:false) { |c| c.vm.box = box }
    }

    #   Configure a serial port on the VM. Optionally, enable the
    #   graphical console if you want to verify that it can be used
    #   along with the serial console.
    #
    #   Run the `console` script to connect to the serial port.
    #   This can be done before `vagrant up` to connect at boot.
    #
    com1_sock = File.join(File.dirname(__FILE__), '.com1')
    c.vm.provider("virtualbox") { |v|
        v.customize ['modifyvm', :id,
            '--uart1', '0x3f8', '4', '--uartmode1', 'server', com1_sock, ]
        v.gui = false
    }

    c.vm.provision('ansible') { |a|
        a.groups = { vagrant: 'default' }
        a.galaxy_role_file = 'ansible/requirements.yml'
        a.playbook = 'ansible/setup.yml'
    }

    #   Don't run .home/public/Setup without saving authorized_hosts first!
    dhsrc = ENV['HOME'] + '/.home/public'; Dir.exist?(dhsrc) \
        && c.vm.provision('file', source: dhsrc, destination: '~/.home/public')
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
#   Multiple hosts derived from base configuration (named 'default'):
#       config.vm.define('host1') { |h|
#           h.vm.network 'private_network', ip: '192.168.50.3'; #etc
#       }
#   Map ports with
#       c.vm.network 'forwarded_port', guest: 80, host: 8080
#   Set up private network or public one (usually with a bridge):
#       c.vm.network 'private_network', ip: '192.168.33.10'
#       c.vm.network 'public_network'
#   Share an additional folder to the guest VM (host path, guest path, opts):
#       c.vm.synced_folder '../data', '/vagrant_data'
#   Sample provider-specific options:
#       c.vm.provider('virtualbox') { |vb|
#           vb.gui = true
#           vb.memory = '1024'
#       }
#   Sample provisioning:
#       c.vm.provision 'shell', inline: <<-SHELL
#           apt-get update
#           apt-get install -y apache2
#       SHELL
