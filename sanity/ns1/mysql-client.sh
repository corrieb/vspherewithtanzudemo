#!/bin/bash
kubectl run -it --rm --image=mysql:5.6 --overrides='{ "spec": { "securityContext" : { "runAsUser": 999 } } }' --restart=Never mysql-client -- mysql -h mysql -ppassword
