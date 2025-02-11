#!/bin/bash

# Setup Kind Cluster
kind create cluster --config=./manifests/kind-config.yaml
kubectl cluster-info --context kind-kind

# Ingress Controller
./scripts/ingress-nginx.sh

# Jenkins
./scripts/jenkins.sh

# Certificate Manager
./scripts/cert-manager.sh