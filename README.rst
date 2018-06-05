.. image:: https://travis-ci.com/webknjaz/ansible-gentoo-laptop.svg?branch=master
   :target: https://travis-ci.com/webknjaz/ansible-gentoo-laptop

ansible-gentoo-laptop
=====================

Merge apps::

    ansible-playbook -i hosts --connection=local install-apps.yml

Rebuild world::

    ansible-playbook -i hosts --connection=local rebuild-world.yml

Configure userspace stuff::

    ansible-playbook -i hosts --connection=local configure-userspace.yml

Prerequisites
-------------

Before using, make sure you have ``kbfs`` running::

    kbfsfuse

Notes
-----

* Lenovo P50 can only output video to either internal (built-in) laptop display
  or external ones if graphics mode is Hybrid and proprietary NVidia drivers
  are being used. So to make it work thoughout all available displays, disable
  it in BIOS by selecting Discrete mode.
  Also, open source nouveau drivers seem to handle this better (i.e. work in
  Hybrid mode).

* When using dock station with Lenovo P50, make sure to plug one external
  display to the station's Display Port and plug the other one to the direct
  HDMI output in the laptop itself. Two external displays connected to the
  dock station don't work.
