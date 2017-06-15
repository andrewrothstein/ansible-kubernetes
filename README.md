andrewrothstein.kubernetes
==========================
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-kubernetes.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-kubernetes)

Installs [Kubernetes](http://kubernetes.io/docs/getting-started-guides/binary_release/#prebuilt-binary-release)  binaries to /usr/local/bin.

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
	- andrewrothstein.kubernetes
```

License
-------

MIT

Author Information
------------------

* Fouad Semaan <semaanfouad@gmail.com>
* Andrew Rothstein <andrewrothstein@gmail.com>
* Vishal Shah <vishal.shah@nyu.edu>
