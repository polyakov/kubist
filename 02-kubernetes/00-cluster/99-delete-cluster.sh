#!/usr/bin/env bash

#show what resources would be deleted when removing a cluster
kops delete cluster ${NAME}

#actually delete the cluster
#kops delete cluster ${NAME} --yes
