# Deploy app

Overview
----

Adding our app to cluster by deploying a RC and service with the the application pod we crated previously. 


Steps:
----
1. **Update ``./app/rc-app.json`` with your namespace.**

1. Deploy app in one command by invoking ``kubectl create`` with a directory argument.

    ```
    kubectl create -f ./app
    ```

1. Get service details, in partucular note the port of the service
    ```
    kubectl describe svc app-api-svc
    ```
    
1. List nodes to get an IP address.  Pick any node and note its public IP address or DNS name (e.g. ec2-54-210-108-3.compute-1.amazonaws.com)
    ```
    kubectl describe nodes
    ```
1. Craft a URL from IP and port acquired in the prior two steps and check that the site is up.
   ```
   http://<any node IP address>:<port from kubectl describe svc app-api-svc>
   ```

