# Spin up the cluster

Overview
----

In this step we launch our cluster.  It's incredibly easy.  You can can do it one step, but we'll check the config before actually making the changes.

Steps:
---


1. Setup the cluster config
    ```
    kops create cluster --zones us-east-1a ${NAME}
    ```
1. Get cluster info (optional)
    ```
    kops get cluster
    ```
    
1. This is the steps where we actually create the cluster by adding **--yes**
    ```
    kops create cluster --zones us-east-1a ${NAME} --yes
    ```

1. Creating resources can take a few minutes.  You can see the nodes come up using kubectl or in AWS console.
    ```
    watch kubectl get nodes
   ```
   
Next step: [Configure the cluster](03-cluster-config.md)