#!/bin/bash

# edit to use your docker hub repo name if you plan to push (mine is polyakov)
cp Dockerfile-from-node ~
cd ~
docker build . --file Dockerfile-from-node --tag polyakov/mongodb-demoapp-2017
