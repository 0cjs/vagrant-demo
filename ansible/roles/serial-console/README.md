serial-console
==============

Reconfigure a CentOS 7 system to use a serial console.

Notes:
* This role doesn't include a test framework. :-(
* This is likely to work with minimal modification on other flavours
  of Linux as well, but hasn't been tested.


Role Variables
--------------

None, as of yet. Missing variables:
* Location of `/etc/default/grub`? Or is that the same everywhere?
  (It's given that explicit path in the generic grub documentation.)
* Location of `grub.cfg`
* bps rate for serial port


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - role: serial-console


License
-------

Unlicensed. All rights reserved.


Author Information
------------------

Curt J. Sampson <cjs@cynic.net>
https://github.com/c-j-s
