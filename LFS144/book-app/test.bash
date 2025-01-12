#!/usr/bin/env bash

PRODUCTPAGE_POD=$(kubectl get pod -l app=productpage -ojsonpath='{.items[0].metadata.name}')

CURL_POD=$(kubectl get pod -l app=curl -ojsonpath='{.items[0].metadata.name}')

kubectl exec $CURL_POD -it -- curl productpage:9080/productpage | head

while true; do kubectl exec $CURL_POD -it -- curl productpage:9080/productpage; sleep 1; done

while true; do kubectl exec $CURL_POD -it -- curl productpage:9080/productpage; sleep 0.3; done

