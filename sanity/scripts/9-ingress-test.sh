#!/bin/bash

# See https://docs.vmware.com/en/VMware-vSphere/7.0/vmware-vsphere-with-tanzu/GUID-457B1569-DFDC-4849-959C-72EDA72030AD.html

# Note that this requires a PSP binding for the default service account
#   see rolebindings/rolebinding-def-svc-acc-psp.yaml

namespace=${1:-default}
name="hello"

kubectl apply -f sanity/9-ingress-test.yaml
util/wait-for-deployment.sh "$namespace" "$name"
kubectl get deployment "$name"
kubectl get service ingress-nginx-controller
echo -e "\nProceeding to wait for ingress IP. This can take a while to sync"
echo -e "The above Service External IP should work if you want to try http://<ingress IP>/hello\n"
util/wait-for-ingress-IP.sh "$namespace" "ingress-$name"
kubectl get ingress
echo -e "\nYou should now be able to hit http://<ingress IP>/hello in a browser"