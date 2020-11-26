#!/bin/bash

# See https://kubernetes.io/docs/tasks/run-application/run-stateless-application-deployment/

# Note that this requires a PSP binding for the default service account
#   see rolebindings/rolebinding-def-svc-acc-psp.yaml

namespace=${1:-default}
name="nginx-deployment"

kubectl -n "$namespace" apply -f sanity/3-deployment.yaml
util/wait-for-deployment.sh "$namespace" "$name"
kubectl -n "$namespace" get deployment "$name"