# Build Docker machine from scratch

Starting from Fedora 25 cloud image, build a client machine for Docker and Kubernetes use.



Setup VirutalBox Docker Build VM from scratch
---------------------------------------------
1. Clone the code if needed
    ````
    git clone --depth=1 https://github.com/polyakov/kubist
    ````

1. go to "from scratch"
    ```
    cd kubist/01-docker/Vagrant-build/from-scratch
    ```

1. launch the virtual machine from this directory (uses Vagrantfile settings)
    ```
    vagrant up
    ```

1. Install tools (git, node, docker)
    1. connect to VM using vagrant
        ```
        vagrant ssh
        ```
    1. run install scripts
        ```
        cd /vagrant
        ```
    
    1. install git, wget, unzip,node:
        ```
        ./01_setup-build-server.sh
        ```
    
    1. install docker
        ```
        ./02_install-docker.sh
        ```
1. relogin to update group membership and avoid using sudo every time we invoke the "docker" command
    ```
    exit
    vagrant halt
    vagrant up
    vagrant ssh
    ```

1. download docker images we will use to construct our application container (node base container)
    ```
    ./03_prep-docker-images.sh
    ```

Next step: [Run application](02-run-app.md)