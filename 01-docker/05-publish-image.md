Overview
--------

Once we have an image we want to store in way that allows our servers to access it during deployment.  In the example, we are using Docker Hub.  Amazon, Azure and others offer private registries in the cloud.  It's also not very hard to establish a try a private repo on prem.


Publish the image
-----------------

- List images
```
docker images
```

- Tag the image with version.  The first part of the image name, "polyakov", should match your docker hub image name, the second part is the image name and the third part, after the colon, is he tag.
```
docker tag polyakov/mongodb-demoapp-2017 polyakov/mongodb-demoapp-2017:20170602
```

- login to Docker hub
```
docker login
```

- And, push
```
docker push polyakov/mongodb-demoapp-2017:20170602
```

- Confirm that image have been uploaded
```
https://hub.docker.com/r/polyakov/mongodb-demoapp-2017/
```


Docker demo done!!

Next step: [Kubernetes demo](../)