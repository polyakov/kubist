# Deploy MongoDB

Overview
----

If we are deploying the entire MongoDB replica set, itit's easier to pass a directory to ``kubectl``, it's alos possible to create each element (Pod, Replication Controller, Service) one at a time.
 
 
 Steps:
 ---
 1. Create MongoDB pods
    ```
    kubectl create -f ./create/mongodb/pod-mongo-db1.json
    kubectl create -f ./create/mongodb/pod-mongo-db1.json
    ```
    check pods
    ```
    kubectl get pods
    ```
 1. Create arbiter 
    ```
    kubectl create -f ./create/mongodb/rc-arb.json
    ```
    check replication controllers
    ```
    kubectl get rc
    ```
 1. Create services
    ```
    kubectl create -f ./create/mongodb/svc-arb.json
    kubectl create -f ./create/mongodb/svc-mongo-db1.json
    kubectl create -f ./create/mongodb/svc-mongo-db2.json
    ```
    check services
    ```
    kubectl get svc
    ```


Continue at step 2 to configure MongoDB replica set: [Continue at step 2 of this link](06-deploy-mongodb.md)