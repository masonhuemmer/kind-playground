#!/bin/bash

# Prerequisites
kubectl apply -f ./manifests/jenkins-namespace.yaml
kubectl apply -f ./manifests/jenkins-volume.yaml
kubectl apply -f ./manifests/jenkins-serviceaccount.yaml

# Helm
chart=jenkinsci/jenkins
helm install jenkins -n jenkins -f ./config/jenkins-values.yaml $chart

# Wait
kubectl wait --for=condition=Ready pod --all -n jenkins --timeout=300s

# Ingress
# After creating this resource, update the /etc/hosts file
#
# 127.0.0.1   jenkins.huemmer.cloud
kubectl apply -f ./manifests/jenkins-ingress.yaml

# Get Username and Password
kubectl get secret jenkins -n jenkins -o go-template='{{range $k,$v := .data}}{{printf "%s: " $k}}{{if not $v}}{{$v}}{{else}}{{$v | base64decode}}{{end}}{{"\n"}}{{end}}'
kubectl get secret jenkins -n jenkins -o json | jq '.data | map_values(@base64d)'

# Troubleshoot
# kubectl describe pod $(kubectl get pods -n jenkins -l app=jenkins -o jsonpath='{.metadata.name}') -n jenkins
