#!/bin/bash

helm repo add jenkinsci https://charts.jenkins.io  --force-update
helm repo update

kubectl apply -f ./manifests/jenkins-namespace.yaml
kubectl apply -f ./manifests/jenkins-volume.yaml
kubectl apply -f ./manifests/jenkins-serviceaccount.yaml
