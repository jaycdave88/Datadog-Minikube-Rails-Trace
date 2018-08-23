#!/bin/bash

set -euo pipefail

function main() {
  kubectl apply -f datadog-agent.yaml
  create_database
  apply_api_key
}

function apply_api_key() {
  echo -n "applying Datadog API Key"

  DD_API_KEY={API_KEY} docker-compose up

  echo
}
function create_database(){
	docker-compose run --rm web rake db:create
	docker-compose run --rm web rake db:migrate
}
main