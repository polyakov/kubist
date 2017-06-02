Overview
--------
In this step we run both MongoDB and the application using docker.  First we pull the official MongoDB docker image and then run both application and DB usinder docker

Run the application with Docker
-------------------------------

- Pull official MongoDB image from Docker Hub - [https://hub.docker.com/_/mongo/](https://hub.docker.com/_/mongo/)\.
```
docker pull mongo
```

- check images for mongo image
```
docker images
```

- launch database
```
docker run --detach --name=2017mongo_db  mongo
```
```--detach``` - run as daemon

```--name``` - provide a meaningful name for the container. Otherwise docker will assign one.

- check that the container is running by listing all running containers
```
docker ps
```

- get container details; note container's IP
```
docker inspect 2017mongo_db
```

- now that our database is running, let's connect the application:
```
docker run --detach \
    --name=2017mongodb_app \
    -e "MONGO_CONNECTION_STR=mongodb://172.17.0.2:27017/demo" \
    -p 8080:8080 \
    polyakov/mongodb-demoapp-2017
```

```-e``` set environment variable for the container

```-p``` forward port to the host

- check that the application is running by accessing the container directly
 - get container IP
 ```
 docker inspect 2017mongodb_app
 ```
 - hit container directly
 ```
 curl 172.17.0.3:8080
 ```

- check application content in the VM; we are forwarding ports from docker conctainer to the VM.
```
curl localhost:8080
```

- hit application from host machine; we are forwarding port from VM to the host by access [http://localhost:8080](http://localhost:8080) from your browser.


Next step: [Publish image](05-publish-image.md)



