#!/bin/bash
set -x

kubectl vsphere login --server=192.168.20.128 --vsphere-username wcp-edit-t1@vsphere.local
kubectl config use-context test-cluster
