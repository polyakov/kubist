# Cluster config

Overview
----

We want to do a little prep in our cluster for the deployment.  Some of our nodes will be optimized for running MongoDB and other will be more suited to running the application.  

Kubernetes uses labels to match resources, so in this step will label some nodes for DB and Arbiter and other for APP and www.

We also would like to isolate our application from other application by using kubernetes namespaces.  We'll set a default namespace.

Steps:
---
1. Pick some nodes and label them for the database.  We want nodes in the MongoDB replica set running on different machines.  We'll label some with mongo1 and some with mongo2.
    ```
    kubectl label node <nodeId> node=mongo-db1 arbiter=true
    kubectl label node <nodeId> node=mongo-db2 arbiter=true
    ```

1. Label the rest of the nodes
    ```
    kubectl label node <nodeId> app=true www=true
    ```
    
1. Define a default namespace
    1. Set namespace as a env variable.  **Change the namespace to your own name**
        ```
        export NAMESPACE=polyakov3519
        ```
    1. Create namespace
        ```
        kubectl create namespace ${NAMESPACE}
        ```
    1. Set your namespace default
        ```
        kubectl config set-context $(kubectl config current-context) --namespace=${NAMESPACE}
        ```
    1. Check to see that the namespace has been set
        ```
        kubectl config view | grep namespace:
        ```
    
    
Next step: [Deploy MongoDB](06-deploy-mongodb.md)
