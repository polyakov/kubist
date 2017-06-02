#!/usr/bin/env bash

# before running this script please setup AWS key and secret
#export AWS_SECRET_ACCESS_KEY=
#export AWS_ACCESS_KEY_ID=

# Note: this defined the cluster, but does not create it.
kops create cluster --zones us-east-1a ${NAME}
kops get cluster

