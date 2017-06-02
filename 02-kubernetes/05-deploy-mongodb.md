# Deploy MongoDB

Overview
----

In this step, we are starting to create components.  We'll do this step by step. However, it is also convenient (though less educational) to create all the components at once by passing in the entire component directory.
 ```kubectl create -f ./create```
 
 We are using "naked" pods, not managed by a [ReplicaSet](https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/) because we don't want them to restart automatically.  If our database went down we want someone to figure out why.
 
 For the purposes of this demo we are using "emotyDir" volume. In production MongoDB deployment we would want to use [Persistent Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#types-of-persistent-volumes) appropriate for our environment.
 
 Steps:
 ---
 1. Create all MongoDB components in one command
    ```
    kubectl create -f ./create/mongodb
    ```
    Skip to step #2 below.
    
**Or,**    
    
 1. Create components one at a time
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
 1. Once pods are running we can configure the MongoDB replica set.
    1. connect to first pod
        ```
        kubectl exec -ti mongo-db1 mongo
        ```
        Syntax is same as ``docker exec``.
    1. Initialize MongoDB RS.  **Note: Set your namespace in "host" value.**
        ```
        rs.initiate(
        {
                "_id" : "demoRS",
                "version" : 1,
                "protocolVersion" : NumberLong(1),
                "members" : [
                        {
                                "_id" : 0,
                                "host" : "mongo1-svc.<namespace>.svc.cluster.local:27017",
                                "arbiterOnly" : false,
                                "buildIndexes" : true,
                                "hidden" : false,
                                "priority" : 1,
                                "tags" : {
        
                                },
                                "slaveDelay" : NumberLong(0),
                                "votes" : 1
                        }
                ]})
        ```
    1. Add second node to config. **Note: Set your namespace in "host" value.**
        ```
        rs.add("mongo2-svc.<namespace>.svc.cluster.local:27017")		
        ```
    1. Add the arbiter. **Note: Set your namespace in "host" value.**
        ```
        rs.addArb("arbiter-svc.<namespace>.svc.cluster.local:27017")
        ```
    1. Check status
        ```
        rs.status()
        ```

Next step: [Deploy App](06-deploy-app.md)