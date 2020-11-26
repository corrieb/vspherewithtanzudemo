#!/bin/bash

# See https://docs.vmware.com/en/VMware-vSphere/7.0/vmware-vsphere-with-tanzu/GUID-457B1569-DFDC-4849-959C-72EDA72030AD.html

# Note that this requires PSP bindings for the service accounts used in the helm chart
#   see rolebindings/rolebinding-ingress-nginx-psp.yaml

namespace=${1:-default}
name="ingress-nginx-controller"

if [[ ! $(type -P "helm") ]]; then
    { echo "helm is not in PATH" 1>&2; exit 1; }
fi

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install --debug ingress-nginx ingress-nginx/ingress-nginx
util/wait-for-deployment.sh "$namespace" "$name"
kubectl get deployment "$name"
kubectl get services
echo -e "\nYou should now have a load-balanced service IP for the ingress controller"