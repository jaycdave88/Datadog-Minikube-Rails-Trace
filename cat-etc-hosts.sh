#!/bin/sh

set -euo pipefail

# gracefully handle the TERM signal sent when deleting the daemonset
trap 'exit' TERM

# do the work
# the /etc/hosts file of the node is mapped to /node/etc/hosts
cat /node/etc/hosts

# let the monitoring script know we're done'
echo "done"

# this is a workaround to prevent the container from exiting 
# and k8s restarting the daemonset pod
while true; do sleep 1; done
