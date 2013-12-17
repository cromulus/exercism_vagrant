A Vagrant/Chef setup for running exercism.io assignments.
=======

WAT?
---------
Keep your personal computer nice and clean and tidy while running all of your favorite [Exercism.io](http://exercism.io) assignments on a virtualmachine with all of the goodies pre-installed. (except Objective C. Sorry!)

* [Vagrant](http://vagrantup.com): manages virtualmachines like a boss.
* [Chef](http://www.getchef.com/chef/): cookbooks to setup computers JUST the way you like them.

Install:
----------
* clone this repository
* install [Vagrant](http://vagrantup.com)
* install [Virtualbox](http://virtualbox.org)

Install some handy vagrant plugins:
```bash
vagrant plugin install vagrant-omnibus # makes chef work.
vagrant plugin install vagrant-cachier # for the speediness
vagrant plugin install vagrant-librarian-chef # handles chef cookbooks
```

Now you are ready to roll!

HOWTO
------------
to boot the VM run:
```bash
vagrant up && vagrant provision
```

It will take a while (the second time should be faster) but you should have a fully functional environemnt with just about everything installed.

Edit the files as you would normally, in your favorite text editor then run the tests in your VM. To run the tests, ssh into the virtual machine with:
```
vagrant ssh
```

Then run the exercism.io assignments as you normally would!
