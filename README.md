# Environment setup:

### Install for dependencies:
Installing minikube locally: https://github.com/kubernetes/minikube
Installing Vagrant: http://sourabhbajaj.com/mac-setup/Vagrant/README.html
Installing Docker: https://pilsniak.com/how-to-install-docker-on-mac-os-using-brew/

### Install Datadog Agent and Trace Agent on MacOS:
Install the Datadog Agent:

https://app.datadoghq.com/account/settings#agent/mac

Open a browser and navigate to:  http://127.0.0.1:5002/

This is the Datadog Agent UI 

Under the “Settings” option add the following-line:

`apm_config: 
   enabled: true`

More info can be found here: https://docs.datadoghq.com/tracing/setup/

Next navigate to: https://github.com/DataDog/datadog-trace-agent

The reason you are navigating here is because the Mac OS X Agent 
does not have the Trace Agent part of it. So you need to install the separately.

Download this: https://github.com/DataDog/datadog-trace-agent/releases/download/6.4.1/trace-agent-darwin-amd64-6.4.1

Move the downloaded file to a folder or directory then

Open terminal 

`Run ps -ef | grep agent`

This will show all the agent process that are running in the background

Navigate in Terminal to the folder that the: 

trace-agent-darwin-amd64-6.4.1

Then run the following command to start the trace-agent: 

`sudo ./trace-agent-darwin-amd64-6.4.1 -config /opt/datadog-agent/etc/datadog.yaml`

If you run into an issue that says you can not run start the trace agent: 

Run the following command in Terminal
`chmod 777 trace-agent-darwin-amd64-6.4.1`

# Run minikube machine: 
Start command: `minikube start`
Delete command: `minikube delete`

...Once your minikube machine has started and you are returned to the normal Terminal prompt run: `chmod u+x run-once-daemonset.sh` - this will give the shell script executable permissions.

# Provide Datadog API Key:
Within the `run-once-daemonset.sh` you will need to provide your Datadog API key.

# Start Rails APP:
Launch all services (it will trigger a Docker build):

`docker-compose up`

When the MySQL service is up and running, launch in another console the following
command to create the application database:

`docker-compose run --rm web rake db:create`

`docker-compose run --rm web rake db:migrate` 

... might want to run these in a new Terminal window.

# App infromation: 

#### Compatibility stack

* Ruby 2.5.1
* Rails 5.2.1
* MySQL adapter (mysql2)
* Redis 4.0.1
* Unicorn 5.4.1
* Passenger 5.3.4

#### Backing services

* MySQL 8.0
* Redis 4.0.11

##### Using the example application

Access the blog at http://localhost:3000/ and login using the default user/password `me`/`123456`.
