# Run the app to test it
Overview
--------

In the prior step, we setup a virtual machine with node and our application.  Now it's time run it to make sure it works.  Vagrantfile instructed the VM to forward port 3000 to the host, so we will be able to access the application on [http://localhost:3000](http://localhost:3000).

Our application uses MongoDB. For this test we'll use mLabs sandbox.

Prerequisites
-------------
1. You shoud have a MongoDB connection string.  For purposes of the demo we are using mLab sandbox. Any MongoDB instance will do.

Run the app
-----------

1. ssh to the VM
    ```
    vagrant ssh
    ```

1. Run the app using node.  This will start the app on port 3000
    ```
    export MONGO_CONNECTION_STR=<connectionstring>
    cd ~/demoapp/app/server
    node ./index.js &
    ```

1. Test the app in the VM using curl.  You should see valid HTML.
    ```
    curl localhost:3000
    ```

1. Test the app using forwarded port from host browser at [http://localhost:3000/#/tech](http://localhost:3000/#/tech)

Next step: [Build a Docker image](03-build-image.md)
