# Environment setup:

### Install for dependencies:
Installing minikube locally: https://github.com/kubernetes/minikube

Installing Vagrant: http://sourabhbajaj.com/mac-setup/Vagrant/README.html

Installing Docker: https://pilsniak.com/how-to-install-docker-on-mac-os-using-brew/

# Run minikube machine: 
Start command: `minikube start`

Delete command: `minikube delete`

Minikube UI: `minikube dashboard`

# Once your minikube machine has started and you are returned to the normal Terminal prompt run: 
`chmod u+x run-once-daemonset.sh` - this will give the shell script executable permissions.

# Provide Datadog API Key:
Within the `run-once-daemonset.sh` and the `datadog-agent.yaml` - provide your Datadog API key.

# Start the Web App:
Launch all services (it will trigger a Docker build) and will start to report within Datadog:

Within your terminal session run:
`./run-once.daemonset.sh`

# Open a Web browser and cause load for the Datadog APM Trace Agent:

Access the blog at http://localhost:3000/ and login using the default user/password `me`/`123456`.

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
