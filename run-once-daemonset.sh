#!/bin/bash

set -euo pipefail

function main() {
  kubectl apply -f daemonset.yaml
  wait_for_pods cat-etc-hosts
  wait_for_cats cat-etc-hosts
  kubectl delete -f daemonset.yaml
}

function wait_for_pods() {
  echo -n "waiting for $1 pods to run"

  PODS=$(kubectl get pods | grep $1 | awk '{print $1}')

  for POD in ${PODS}; do
    while [[ $(kubectl get pod ${POD} -o go-template --template "{{.status.phase}}") != "Running" ]]; do
      sleep 1
      echo -n "."
    done
  done

  echo
}

function wait_for_cats() {
  echo -n "waiting for $1 daemonset to complete"

  PODS=$(kubectl get pods | grep $1 | awk '{print $1}')

  for POD in ${PODS}; do
    while [[ $(kubectl logs ${POD} --tail 1) != "done" ]]; do
      sleep 1
      echo -n "."
    done
  done

  echo
}

main