#!/bin/bash

set -euo pipefail

function main() {
  kubectl apply -f datadog-agent.yaml
  apply_api_key
}

function apply_api_key() {
  echo -n "applying Datadog API Key"

  DD_API_KEY={API_KEY} docker-compose up

  echo
}
main