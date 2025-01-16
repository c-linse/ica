#!/usr/bin/env bash

clustername="ica"

echo "deleting kind cluster kind-$clustername"
kind delete cluster --name="kind-$clustername"

echo "starting kind cluster kind-$clustername"
kind create cluster --name="kind-$clustername"

kubectl config use kind-kind-ica

kubectl apply -f 1-istio-init.yaml
kubectl apply -f 2-istio-minikube.yaml
kubectl apply -f 3-kiali-secret.yaml
kubectl apply -f 4-label-default-namespace.yaml

sleep 5

kubectl wait --for=condition=ready pod -n istio-system --all --timeout=300s

kubectl apply -f 5-application-no-istio.yaml

kubectl apply -f 6-istio-rules.yaml
sleep 5

kubectl wait --for=condition=ready pod -n default --all --timeout=300s

kubectl port-forward svc/istio-ingressgateway 31380:80 -n istio-system &
kubectl port-forward svc/tracing 16686:80 -n istio-system &
kubectl port-forward svc/kiali 31000:20001 -n istio-system &
kubectl port-forward svc/grafana 3000:3000 -n istio-system &

echo "Open urls"
echo "Webapp: http://localhost:31380"
echo "Jaeger: http://localhost:16686"
echo "Kiali: http://localhost:31000"
echo "Grafana: http://localhost:3000"
