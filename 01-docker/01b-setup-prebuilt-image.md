# Launch from prebult image

Below are instructions to download the image from AWS S3 and load it into VirtualBox with vagrant.


From prebuilt box image:
------------------------
1. Download the image from AWS using:    
    1. Linux
        ```
        curl https://s3.amazonaws.com/2017mongodb/Vagrant/build-mongodb-2017.box
        ```
    1. Windows
        ```
         curl -OutFile build-mongodb-2017.box https://s3.amazonaws.com/2017mongodb/Vagrant/build-mongodb-2017.box
         ```

1. Import into virtual box:
    ```
    vagrant box add ./build-mongodb-2017.box --name polyakov/docker-k8s-build --force
    ```
    
1. Download Vagrant config to run the VM and launch it:
    ```
    git clone --depth=1 https://github.com/polyakov/kubist
    cd ~/kubist/01-docker/Vagrant-build/prebuilt
    vagrant up
    ```

Next step: [Run application](02-run-app.md)
