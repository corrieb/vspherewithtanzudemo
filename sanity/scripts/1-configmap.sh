#!/bin/bash

namespace=${1:-default}

kubectl -n "$namespace" apply -f sanity/1-configmap.yaml