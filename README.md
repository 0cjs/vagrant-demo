vagrant-demo
============

This repository demonstrates and documents the use of [Vagrant]. It
uses the [VirtualBox] provider, but can easily be tweaked to use
another provider if you prefer.

Most everything should be documented in the various files, but further
useful information might be gleaned from the commit log which not only
may have further information in the commit messages but also
demonstrates a progression of changes that introduce new features.

[Vagrant]: https://www.vagrantup.com/docs/
[VirtualBox]: https://www.virtualbox.org/


Serial Console
--------------

[`Vagrantfile`] includes VirtualBox provider configuration to add a
serial port to the guest, attached to a Unix domain socket (`.com1`).
You can connect to the serial port using the supplied `console`
script.

Note that nothing on the default guest is configured to talk to the
serial port; you must set up the guest to do that manually. You can
read the instructions in [`SERIAL.md`](SERIAL.md) to learn how to set
up a serial console on your guest.


Ansible
-------

This repo also includes a demonstration of using [Ansible] to provision
(either manually or via Vagrant) the guest; documentation is provided
in the various files. 

Comments in [`ansible.cfg`] and [`ansible/requirements.yml`] describe
how to run Ansible manually. [`ansible/hosts`] contains the host
inventory used when doing so, and it may need to be tweaked depending
on what dynamic information (e.g., SSH server port) Vagrant chose when
it started your guest.

The host inventory is automatically generated when Vagrant provisions
the guest; [`Vagrantfile`] determines which playbook is used.

Two sample playbooks are included.

* [`ansible/sample.yml`] demonstrates various things that do not
  change the guest, including including tasks, variables and a sample
  role (that does nothing) created with `
    ansible-galaxy init template-role -p ansible/roles/
  `.

* [`ansible/setup.yml`] does basic setup of a host such as installing
  useful packages; Vagrant uses this to provision the guest.

[Ansible]: https://docs.ansible.com/ansible/
[`Vagrantfile`]: Vagrantfile
[`ansible.cfg`]: ansible.cfg
[`ansible/requirements.yml`]: ansible/requirements.yml
[`ansible/hosts`]: ansible/hosts
[`ansible/sample.yml`]: ansible/sample.yml
[`ansible/setup.yml`]: ansible/setup.yml
