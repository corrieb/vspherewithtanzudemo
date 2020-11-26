#!/bin/bash

# Creates a pod in the cluster with a Debian shell. Useful for debugging

kubectl run -i --tty busybox --image=docker.io/library/debian:latest --restart=Never -- sh
kubectl delete pod busybox
