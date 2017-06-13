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
    kops update cluster ${NAME} --yes
    ```

1. Creating resources can take a few minutes.  You can see the nodes come up using kubectl or in AWS console.
    ```
    watch kubectl get nodes
   ```
   
Next step: [Configure the cluster](03-cluster-config.md)


Publish config to aws
-------

1. Copy the file to locahost (that's where I have AWS tools installed):
    ```
    scp -P 2222 -i C:/Users/polya/.vagrant.d/insecure_private_key vagrant@127.0.0.1:/home/vagrant/.kube/config .
    ```
    
1. Upload to S3
    ```
    aws s3 cp .\config s3://mongodb-2017/config --profile=pm
    ```
    

FAQ:
---

1. error reading SSH key file

    ```
    [ec2-user@ip-172-30-4-251 ~]$ kops create cluster --zones us-east-1a ${NAME}
       I0604 02:14:05.348207    8257 create_cluster.go:661] Inferred --cloud=aws from zone "us-east-1a"
       
       error reading SSH key file "/home/ec2-user/.ssh/id_rsa.pub": open /home/ec2-user/.ssh/id_rsa.pub: no such file or directory
    ```
    
    **Solution:**
    ```
    ssh-keygen -t rsa
    ```
