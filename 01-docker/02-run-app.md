Overview
--------

In the prior step, we setup a virtual machine with node and our application.  Now it's time run it to make sure it works.  Vagrantfile instructed the VM to forward port 3000 to the host, so we will be able to access the application on [http://localhost:3000](http://localhost:3000).

Our application uses MongoDB. For this test we'll use mLabs sandbox.

Prerequisites
-------------
- MongoDB connection string

Run the app
-----------

- ssh to the VM
```
vagrant ssh
```

- Run the app using node.  This will start the app on port 3000
```
export MONGO_CONNECTION_STR=<connectionstring>
cd ~/demoapp/app/server
node ./index.js &
```

- Test the app in the VM using curl.  You should see valid HTML.
```
curl localhost: 3000
```
- Test the app using forwarded port from host browser at http://localhost:3000


Next step: [Build a Docker image](03-build-image.md)
