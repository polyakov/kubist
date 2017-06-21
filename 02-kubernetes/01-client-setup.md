# Client Setup

Overview
--------

During the demo we do not SSH to the cluster.  Kubernetes, like Docker, exposes an API and client tool that can access the API at command line, ```kubectl```.

While ```kubectl``` allows us to manage components running in the cluster, another tool. ```kops``` helps us manage cluster itself.

In this step, we will setup a client from which will access the cluster.  This client represents DevOps desktop machine, for example.

Note that there are a few prerequisites to using kops in AWS.  Our scripts implement steps in [Installing Kubernetes on AWS with kops](https://kubernetes.io/docs/getting-started-guides/kops/).

Steps
-----

1. We will be installing out cluster in AWS and we'll user Amazon Linux instance for our client machine.  Since we will only be using this instance to access kubernetes APIs, any size we'll do. I use micro.

1. Install git and pull this repo
    ```
    sudo yum install -y git
    cd ~
    git clone --depth=1 https://github.com/polyakov/kubist 
    ```

1. We'll be using two environment variables Set environment variable NAME and KOPS_STATE_STORE.
    ```
    export NAME=mongodb2017.preparedmind.net
    export KOPS_STATE_STORE=s3://mongodb-2017
    ```
    or
    ````
    cd ~/kubist
    ./00-cluster/00-env.sh    
    ````

1. Install kubernetes components:
    ```
    ./00-k8s-client-setup.sh
    ```
    This script will:
    - install kubectl and kops
    - create a bucket for kops state
    - create and permission kops user in AWS IAM

Next step: [Spin up your cluster (AWS)](02-cluster-spinup-aws.md)
