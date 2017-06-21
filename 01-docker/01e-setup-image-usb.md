Import Vagrant box:
----------------------
1. Change directory to the location of the box file (USB).
2. Import box file into VirtualBox with the following command

	```vagrant box add ./build-mongodb-2017.box --name polyakov/docker-k8s-build --force```

3. Copy Vagrantfile to local dir

4. Launch VM with ``vagrant up`` for that dir
