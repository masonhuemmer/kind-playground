
# Requires additional troubleshooting with KIND Cluster
# helm upgrade --install ingress-nginx ingress-nginx \
#   --repo https://kubernetes.github.io/ingress-nginx \
#   --namespace ingress-nginx --create-namespace \
#   -f ./config/ingress-nginx-values.yaml



kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
kubectl label node kind-control-plane ingress-ready=true
