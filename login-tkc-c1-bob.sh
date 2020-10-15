#!/bin/bash
set -x

server="192.168.20.128"
cluster="tkg-cluster-1"
namespace="test-cluster"
user="bob-tkg-dev@vsphere.local"

export KUBECONFIG=~/tanzu/bob/kubeconfig
kubectl vsphere login --server="$server" --tanzu-kubernetes-cluster-name="$cluster" --tanzu-kubernetes-cluster-namespace="$namespace" --vsphere-username="$user"
kubectl config use-context "$cluster"

echo "DON'T FORGET TO SET export KUBECONFIG=~/tanzu/bob/kubeconfig"
