#!/bin/bash

# Set the deployment name and local port
DEPLOYMENT_NAME="jupyter-notebook"
LOCAL_PORT=8888

# Get the pod name for the deployment
POD_NAME=$(kubectl get pods -l app="$DEPLOYMENT_NAME" -o jsonpath='{.items[0].metadata.name}')

# Check if the pod name is empty (deployment not running)
if [ -z "$POD_NAME" ]; then
  echo "No pod found for deployment '$DEPLOYMENT_NAME'. Make sure the deployment is running."
  exit 1
fi

# Start port-forwarding
kubectl port-forward "pod/$POD_NAME" "$LOCAL_PORT:8888"
