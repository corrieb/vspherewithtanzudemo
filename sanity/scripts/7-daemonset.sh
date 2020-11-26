#!/bin/bash

# See https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/

# Note that this requires a PSP binding for the default service account
#   see rolebindings/rolebinding-def-svc-acc-psp.yaml

# Note that this YAML prescribes the kube-system namespace

namespace="kube-system"
name="fluentd-elasticsearch"

kubectl apply -f sanity/7-daemonset.yaml
util/wait-for-daemonset.sh "$namespace" "$name"
kubectl -n "$namespace" get daemonset "$name"