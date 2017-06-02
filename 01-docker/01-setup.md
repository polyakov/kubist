Overview
--------
In order to "dockerize" out application we need a maching with some minimal prerequisities:
- we need the application itself
- we need node because our application uses it
- we need docker to create the image and test it

We will execute these steps in a virtual machine running on <a href="https://www.virtualbox.org/" target="_blank">VirtualBox</a> and we'll use <a href="https://www.vagrantup.com/" target="_blank">Vagrant</a> to manage our images and VMs.  <a href="https://www.virtualbox.org/" target="_blank">VirtualBox</a> and <a href="https://www.vagrantup.com/" target="_blank">Vagrant</a> will need to be installed on your machine.



Setup VirutalBox Docker Build VM from scratch
---------------------------------------------
Overview:
- go to "from scratch"
```
        cd Vagrant-build/from-scratch
 ```

- launch the virtual machine from this directory (uses Vagrantfile settings)
```
        vagrant up
```

- Install tools (git, node, docker)
 - connect to VM
```
vagrant ssh
```
 - run install scripts
```
cd /vagrant
```
 - install git, wget, unzip,node:
```
./01_setup-build-server.sh
```
 - install docker
```
./02_install-docker.sh
```
 - relogin to update group membership and avoid using sudo everytime we use "docker" command
```
exit
vagrant halt
vagrant up
vagrant ssh
```
 - download docker images (node base container)
```
./03_prep-docker-images.sh
```

From prebuilt box image:
------------------------

- go to "prebuilt" directory
```
cd Vagrant-build/prebuilt
```
- download box image from S3 (1.7 GB will take a while to download)
```
curl https://s3.amazonaws.com/2017mongodb/Vagrant/build-mongodb-2017.box
```
- import into virtual box
```
vagrant box add ./build-mongodb-2017.box --name polyakov/docker-k8s-build --force
```
- launch
```
vagrant up
```

From Atlas repository:
----------------------

- go to directory Vagrant-build/prebuilt
```
cd Vagrant-build/prebuilt
```

- launch with Vagrant; if the the base machine is missing, vagrant will download it.
```
vagrant up
```

Next step: [Run application](02-run-app.md)