#!/bin/bash

# Setup Kind Cluster
kind create cluster --config manifests/config.yaml
kubectl cluster-info --context kind-kind

# Helm
