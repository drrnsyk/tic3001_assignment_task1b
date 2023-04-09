# Place your commands here
kind create cluster --name kind-1 --config k8s/kind/cluster-config.yaml
kubectl cluster-info
kubectl get nodes

kubectl apply -f k8s/manifests/k8s/backend-deployment.yaml
kubectl get deployments
kubectl get pods

kubectl apply -f k8s/manifests/k8s/backend-service.yaml
kubectl get services

kubectl port-forward service/backend 8080:80

kubectl label nodes kind-1-worker ingress-ready=true
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
kubectl get deployments -n ingress-nginx
kubectl get pods -n ingress-nginx
kubectl apply -f k8s/manifests/k8s/backend-service.yaml
# kubectl apply -f k8s\manifests\k8s\backend-ingress.yaml
kubectl apply -f k8s/manifests/k8s/backend-ingress.yaml
kubectl get pods