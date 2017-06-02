# Set Your Namespace

Overview
---
Kubernetes uses namespaces to partition the environment.  In this set of steps, we'll create the namespace and set it as default.

Steps:
----

1. Set namespace as a env variable.  **Change the namespace to your own name**
    ```
    export NAMESPACE=polyakov3519
    ```
1. Create namespace
    ```
    kubectl create namespace ${NAMESPACE}    ```
1. Set your namespace default
    ```
    kubectl config set-context $(kubectl  config  current-context) --namespace=${NAMESPACE}
    ```
1. Check to see that the namespace has been set
    ```
    kubectl config view | grep namespace:
    ```    
    
    
