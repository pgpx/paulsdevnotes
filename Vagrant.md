# Vagrant

* <https://www.vagrantup.com/>
* [docs](https://docs.vagrantup.com/v2/)

## Safari Books

* [Vagrant: Up and Running](https://www.safaribooksonline.com/library/view/vagrant-up-and/9781449336103/)
* [Vagrant Virtual Development Environment Cookbook](https://www.safaribooksonline.com/library/view/vagrant-virtual-development/9781784393748/)

## Commands

    vagrant --version

Create a new Vagrantfile (named `precise64`) in the current directory:

    vagrant init precise64 http://files.vagrantup.com/precise64.box

Then start the box:

    vagrant up

Connect to the box:

    vagrant ssh

Other comamnds:

    vagrant status
    vagrant suspend
    vagrant halt

Destroy the box (without confirmation):

    vagrant destroy -f
