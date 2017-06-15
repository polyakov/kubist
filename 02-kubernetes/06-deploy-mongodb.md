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
    Note: You can [create Pods, RC and Services one at a time](06-deploy-mongodb-step-by-step.md).  
    
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

Next step: [Deploy App](07-deploy-app.md)