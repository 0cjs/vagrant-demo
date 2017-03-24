vmhost = `hostname -s`.chomp
Vagrant.configure('2') { |c|

    c.vm.define('ltcent', autostart:false) { |c|
        c.vm.box = 'centos/7'
        c.vm.hostname = "ltcent-#{vmhost}"
        #   Vagrant should use this forwarding rather than generating its
        #   own, but it seems still to set up another forwarding in
        #   `c.vm.usable_port_range` as well.
        c.vm.network('forwarded_port', guest: 22, host: 2297)
        #   This should assign the IP address below and no other to this
        #   this VM. However, this appears to be almost completely ignored;
        #   an automatic "nat" interface (Adapter 1) is still set up and
        #   the "hostonly" interface (Adapter 2) has no address.
        c.vm.network('private_network', auto_config: false,
            ip: '192.168.244.97', netmask: '28')
    }
    c.vm.define('ltdeb', autostart:false)  { |c|
        c.vm.box = 'debian/jessie64'        # Debian 8
        c.vm.hostname = "ltdeb-#{vmhost}"
        c.vm.network('forwarded_port', guest: 22, host: 2298)
        c.vm.network('private_network', auto_config: false,
            ip: '192.168.244.98', netmask: '28')
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
