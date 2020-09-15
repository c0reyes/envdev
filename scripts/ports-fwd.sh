#!/usr/bin/env bash

IP=$(minikube ip)

echo "Port forward for ingress..."
sudo socat tcp-listen:8000,fork tcp:$IP:80 &

echo "Port forward for kubernetes..."
sudo socat tcp-listen:8443,fork tcp:$IP:8443 &
