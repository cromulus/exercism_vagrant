A simple vagrant development environment for running exercism.io assignments.

HOWTO:
*clone this repository
* install vagrant
* install virtualbox

run these commands:
```bash
vagrant plugin install vagrant-cachier
vagrant plugin install vagrant-librarian-chef
``

Now you are ready to roll!

to boot the VM run:
```bash
vagrant up && vagrant provision
```

it will take a while (the second time should be faster)
but you should have a fully functional environemnt with just about everything installed.

(except objectiveC. Sorry!)

edit the files as you would normally, then run the tests in your VM. 
