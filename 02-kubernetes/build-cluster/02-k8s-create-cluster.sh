#!/usr/bin/env bash

# create AWS resources needed for the cluster
kops update cluster ${NAME} --yes
kubectl get nodes
