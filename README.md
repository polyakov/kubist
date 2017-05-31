# Deploying MEAN stack application with Docker and Kubernetes

Overview
---

Our goal is to demonstrate a thin line flow though the process of delivering an application from development to production Kubernetes cluster.

By "thin line", I mean a process that is realistic, addresses many of the challenges and manages risks, but is not necessary fully fleshed out. I want this demo to be done in one sitting.  Where i take shortcuts, I will try to note it.

Steps:
---

1. [Dockerize you app](01-docker/README.md)
    
    Steps for taking a working application and publishing it to a Docker repository.
     
2. [Run with Kubernetes](02-kubernetes/README.md)
    
    Deploy the application, the database and related to services to our cluster.
    
    


