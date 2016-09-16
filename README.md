vagrant-demo
============

This repository demonstrates and documents the use of [Vagrant]. It
uses the [VirtualBox] provider, but can easily be tweaked to use
another provider if you prefer.

[Vagrant]: https://www.vagrantup.com/docs/
[VirtualBox]: https://www.virtualbox.org/


Serial Port
-----------

`Vagrantfile` includes VirtualBox provider configuration to add a
serial port to the guest, attached to a Unix domain socket (`.com1`).
You can connect to the serial port using the supplied `console`
script.

Note that nothing on the default guest is configured to talk to the
serial port; you must set up the guest to do that manually.
