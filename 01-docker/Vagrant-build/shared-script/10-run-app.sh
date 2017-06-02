#!/bin/bash

export MONGO_CONNECTION_STR=mongodb://VadimMongoDB2017:MongoDB2017@ds155961.mlab.com:55961/mongodb_2017
cd ~/demoapp/app/server
node ./index.js &
