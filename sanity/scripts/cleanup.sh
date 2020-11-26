#!/bin/bash

# Note that this doesn't clean up any rolebindings

namespace=${1:-default}

kubectl -n "$namespace" delete -f sanity
kubectl delete -f sanity/7-daemonset.yaml
kubectl -n "$namespace" delete pod kuard
helm delete ingress-nginx