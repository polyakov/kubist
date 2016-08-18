0. Setup
------------
```
sudo yum update -y
curl --silent --location https://rpm.nodesource.com/setup_4.x | sudo bash -
sudo yum install -y nodejs
sudo yum install -y gcc-c++ make
sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo yum install -y git
```


1. Containers galore
-----------------
http://hub.docker.com

Examples:
 - mongodb
 - couchdb
 - elasticsearch
 - nginx
 - jenkins


2. Docker: Create a webapp (Node, Angular, material)
-------------
```
git clone --depth=1 https://github.com/angular/material-start
cd material-start
npm install

npm install express --save
vi index.js
//====
var express = require('express');
var app = express();

app.use(express.static( process.cwd()));

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});
//====

node index.js
```

3. Docker: Build and run app in a container
------------

#### Create Dockerfile
```
vi Dockerfile
//=====
FROM centos:7

RUN yum update -y
RUN curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -
RUN yum install -y nodejs npm

ADD . /var/www

WORKDIR /var/www/

EXPOSE 3000
CMD ["node",  "/var/www/index.js"]
//===
```
#### Build the container
```
docker build --tag=preparedminddemo/kubedemo .
docker images
```

#### Run app in a container
```
docker run -d --name=demo1-instance1 preparedminddemo/kubedemo
docker ps

docker inspect demo1-instance
curl <ip>:3000/app/

docker run -d --name=demo1-instance2 -p 8080:3000 preparedminddemo/kubedemo
docker ps
curl localhost:8080/app/
```

#### Go inside the container
```
docker exec -ti demo1-instance2 bash
```

#### Copy files out of and into the container
```
docker cp demo1-instance2:/var/www/index.js .

docker cp index.js demo1-instance2:/var/www/index.js

docker restart demo1-instance2
docker logs demo1-instance2
```

#### Track changes
```
docker diff demo1-instance2
```

#### Push to a docker repo
```
https://hub.docker.com/r/preparedminddemo/kubedemo/

docker login
docker push preparedminddemo/kubedemo

https://hub.docker.com/r/preparedminddemo/kubedemo/
```

#### Clean up
```
docker stop demo1-instance1
docker rm demo1-instance1
docker stop demo1-instance2
docker rm demo1-instance2

docker rmi preparedminddemo/kubedemo
```

#### Deploy
```
docker  pull preparedminddemo/kubedemo
docker run -d --name=demo1-instance2 -p 8080:3000 preparedminddemo/kubedemo
```

### Summary

- Dockerfile
- docker pull
- docker run
- docker push
- docker rm
- docker stop
- docker rmi
- docker restart
- docker diff
- docker cp
- docker logs
- docker inspect
- docker images
- docker inspect
- docker build

4. Kubernetes
===

#### Setup kubernetes
```
cd ~
aws configure

export KUBE_AWS_ZONE=us-east-1e
export NUM_NODES=6
export AWS_S3_REGION=us-east-1
export INSTANCE_PREFIX=k8s-demo
export KUBERNETES_PROVIDER=aws

curl -sS https://get.k8s.io | bash
```
#### Fix it for common.sh bug on AWS
```
wget https://s3.amazonaws.com/preparedmind.net/20160818-demo/common.sh
mv common.sh kubernetes/cluster/
export KUBERNETES_SKIP_DOWNLOAD=true
export PATH=~/kubernetes/platforms/linux/amd64:$PATH
```
#### Bring up the cluster
```
bash kubernetes/cluster/kube-up.sh
```

#### Get config
```
git clone https://github.com/polyakov/kubist
``

#### Label nodes
```
kubectl get nodes
kubectl label node $MONGODB1 node=mongo-db1 arbiter=true
kubectl label node $MONGODB2 node=mongo-db2 arbiter=true

kubectl get nodes -L node -L arbiter

kubectl label node ip-172-20-0-206.ec2.internal app=true www=true

kubectl get nodes -L node -L arbiter -L app -L www
```


#### Add external IPs to www service config
```
vi svc-www.json
```


#### create everything
```
kubectl create -f ./create
```
#### once mongobd is up
```
    kubectl exec mongo-db1 -ti bash
rs.initiate(
{
    "_id" : "demoRS",
    "version" : 1,
    "protocolVersion" : NumberLong(1),
    "members" : [
            {
                    "_id" : 0,
                    "host" : "mongo1-svc.default.svc.cluster.local:27017",
                    "arbiterOnly" : false,
                    "buildIndexes" : true,
                    "hidden" : false,
                    "priority" : 1,
                    "tags" : {

                    },
                    "slaveDelay" : NumberLong(0),
                    "votes" : 1
            }
    ]})

rs.add("mongo2-svc.default.svc.cluster.local:27017")
rs.addArb("arbiter-svc.default.svc.cluster.local:27017")

rs.status()
```



#### It's up - use the website
```
kubectl get nodes
kubectl get pods
kubectl get rc
kubectl get services
```
#### Kill as web pod
```
kubectl get pods
kubectl delete pod
```

#### reload nginx config
kubectl exec -t <pod_name> -c app-www -- service nginx reload

#### Simulate database node going down


###Summary
```
kubectl exec
kubectl get [pod, service, rc, node]
kubectl delete [pod, service, rc, node]
kubectl create -f
kubectl label
```
