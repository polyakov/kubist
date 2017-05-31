# Build application Docker image

Overview
--------

We have working app that we want to package in the docker container.  To do this we need to give ``docker build`` command instructions on how to includes everything the app needs to run.

Build the image
---------------

1. ssh to the VM
    ```
    vagrant ssh
    ```

1. Setup docker file and view it
    ```
    cp /vagrant/Dockerfile-from-node ~/Dockerfile
    more ~/Dockerfile
    ```
    The Dockerfile is fully commented.

1. Build the image
    ```
    cd ~
    docker build . --file Dockerfile --tag polyakov/mongodb-demoapp-2017
    ```

1. Check for new image; there should be one tagged with "polyakov/mongodb-demoapp-2017"
    ```
    docker images
    ```

Next step: [Run application with Docker](04-run-image.md)