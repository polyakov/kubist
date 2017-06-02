Overview
--------

We have working app that we want to package in the docker container.  To do this we need to make that the docker includes the prerequisites we need and runs the application.

Build the image
---------------

- ssh to the VM
```
vagrant ssh
```

- Setup docker file and view it
```
cp /vagrant/Dockerfile-from-node ~/Dockerfile
more ~/Dockerfile
```
The Dockerfile is fully commented.


- Build the image
```
cd ~
docker build . --file Dockerfile --tag polyakov/mongodb-demoapp-2017
```


- Check for new image; there should be one tagged with "polyakov/mongodb-demoapp-2017"
```
docker images
```

Next step: [Run application with Docker](04-run-image.md)