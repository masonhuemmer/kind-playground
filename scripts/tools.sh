#!/bin/bash
# For M1 / ARM Macs

# Kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.26.0/kind-darwin-arm64
chmod +x ./kind
mv ./kind /usr/local/bin/kind

# Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

