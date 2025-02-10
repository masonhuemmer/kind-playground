#!/bin/bash
helm repo add jetstack https://charts.jetstack.io --force-update
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.17.0 \
  --set crds.enabled=true \
  --set prometheus.enabled=false

# ClusterIssuer
kubectl apply -f ./manifests/cert-manager-letsencrypt.yaml

# Add Jenkins Certificate
kubectl apply -f ./manifests/jenkins-certificate.yaml


# Troubleshooting
## kubectl run -i --tty dnsutils --image=tutum/dnsutils --restart=Never --rm -- nslookup jenkins.huemmer.cloud