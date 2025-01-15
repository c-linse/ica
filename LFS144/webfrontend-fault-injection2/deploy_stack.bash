#!/usr/bin/env bash
# install Prometheus, Grafana, Jaeger, and Kiali.
kubectl apply -f ../samples/addons/grafana.yaml
kubectl apply -f ../samples/addons/jaeger.yaml
kubectl apply -f ../samples/addons/kiali.yaml
kubectl apply -f ../samples/addons/prometheus.yaml
kubectl config use kind-kind-ica
kubectl apply -f gw.yaml
kubectl apply -f web-frontend.yaml
kubectl apply -f customers-v1.yaml
kubectl apply -f customers-delay.yaml
