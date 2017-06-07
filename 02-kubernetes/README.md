# Kubernetes Demo

Overview
--------

The goal for this demo is to show how easy it is to get started deploying an application stack with kubernetes.

We'll start with the database - MongoDB.  We'll deploy a MongoDB replica set with two data nodes and an arbiter.

Then we'll add our application and expose it publicly.

Prep
----
If the cluster is running start with #4.  
1. [Setup your client](01-client-setup.md)
1. [Spin up your cluster (AWS)](02-cluster-spinup.md)
1. [Configure the cluster](03-cluster-config.md)



Steps
----
4. [Pull config](04-pull-config.md)
1. [Set your namesapce](05-set-namespace.md)
1. [Deploy MongoDB](06-deploy-mongodb.md)
1. [Deploy App](07-deploy-app.md)

Next step: [Setup your client](01-client-setup.md)