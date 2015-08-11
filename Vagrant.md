# Vagrant

* <https://www.vagrantup.com/>
* [docs](https://docs.vagrantup.com/v2/)

## Safari Books

* [Vagrant: Up and Running](https://www.safaribooksonline.com/library/view/vagrant-up-and/9781449336103/)
* [Vagrant Virtual Development Environment Cookbook](https://www.safaribooksonline.com/library/view/vagrant-virtual-development/9781784393748/)

## Commands

    vagrant --version

Create a new Vagrantfile (named `precise64`) using the specified box in the current directory:

    vagrant init precise64 http://files.vagrantup.com/precise64.box

Then start the virtual machine:

    vagrant up

Connect to the VM:

    vagrant ssh

Other comamnds:

    vagrant status
    vagrant global-status
    vagrant suspend
    vagrant halt

Destroy the VM (without confirmation):

  <pre>vagrant [destroy](http://docs.vagrantup.com/v2/cli/global-status.html) -f</pre>

Manage boxes

    vagrant box list
    vagrant box outdated
    vagrant box remove <box>
    vagrant box add | repackage | update

## VCS

* Commit the `Vagrantfile` but ignore the `.vagrant` directory (which contains machine-specific state).

## Shared filesystem

* By default the directory containing the `Vagrantfile` is shared as `/vagrant` in the VM.
