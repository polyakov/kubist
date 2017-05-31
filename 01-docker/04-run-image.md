# Run application as a Docker container

Overview
--------
In this step we run both MongoDB and the application using docker.  First we pull the official MongoDB docker image and then run both application and DB usinder docker

Run the application with Docker
-------------------------------

1. Pull official MongoDB image from Docker Hub - [https://hub.docker.com/_/mongo/](https://hub.docker.com/_/mongo/)\.
    ```
    docker pull mongo
    ```

1. check images for mongo image
    ```
    docker images
    ```

1. launch database
    ```
    docker run --detach --name=2017mongo_db  mongo
    ```
    options:
    
    ```--detach``` - run as daemon
    
    ```--name``` - provide a meaningful name for the container. Otherwise docker will assign one.

1. check that the container is running by listing all running containers
    ```
    docker ps
    ```

1. get container details; note container's IP
    ```
    docker inspect 2017mongo_db
    ```

1. now that our database is running, let's connect the application:
    ```
    docker run --detach \
        --name=2017mongodb_app \
        -e "MONGO_CONNECTION_STR=mongodb://172.17.0.2:27017/demo" \
        -p 8080:8080 \
        polyakov/mongodb-demoapp-2017
    ```
    options:
    
    ```-e``` set environment variable for the container
    
    ```-p``` forward port to the host

1. check that the application is running by accessing the container directly
    1. get container IP
         ```
         docker inspect 2017mongodb_app
         ```
    1. hit container directly
         ```
         curl 172.17.0.3:8080
         ```

    1. check application content in the VM; we are forwarding ports from docker conctainer to the VM.
        ```
        curl localhost:8080
        ```

    1. hit application from host machine; we are forwarding port from VM to the host by access [http://localhost:8080](http://localhost:8080) from your browser.
    

Next step: [Publish image](05-publish-image.md)



