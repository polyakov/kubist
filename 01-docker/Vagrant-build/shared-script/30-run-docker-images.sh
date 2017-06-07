docker pull mongo
docker run --detach --name=2017mongo_db  mongo

#docker pull polyakov/polyakov/mongodb-demoapp-2017

docker run --detach \
        --name=2017mongodb_app \
        -e "MONGO_CONNECTION_STR=mongodb://172.17.0.2:27017/demo" \
        -p 8080:8080 \
        polyakov/mongodb-demoapp-2017

docker