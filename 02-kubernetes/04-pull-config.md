# Connect to cluster

Overview
----
In order to send commands to the cluster we need to get the right config and place it ```~/.kube/``` directory.


Steps:
----

1. Change directory to ``~/.kube``
    ```
    cd ~/.kube
    ```
    
    If directory does not exists, create it.
    ```
    mkdir ~/.kube
    ```

1. Download the config
    ```
    wget https://s3.amazonaws.com/mongodb-2017/config
    ```

1. Check that you can access the cluster by listing nodes.
    ```
    kubectl get nodes
    ```
    
    