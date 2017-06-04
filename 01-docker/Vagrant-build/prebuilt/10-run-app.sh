#!/bin/bash

export MONGO_CONNECTION_STR=mongodb://<username>:<password>@<server>:<port>/mongodb_2017
cd ~/demoapp/app/server
node ./index.js &
