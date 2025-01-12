#!/usr/bin/env bash

clustername="ica"

echo "deleting kind cluster kind-$clustername"
kind delete cluster --name="kind-$clustername"

echo "starting kind cluster kind-$clustername"
kind create cluster --name="kind-$clustername"

kubectl config use kind-kind-ica