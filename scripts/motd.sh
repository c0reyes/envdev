#!/usr/bin/env bash

export OUTSIDE=$(ip -4 addr show scope global dev docker0 | grep inet | awk '{print $2}' | cut -d / -f 1)
export NET=$(ip -4 addr show dev docker0 | grep inet | awk '{print $2}')

cat <<EOF | tee /etc/motd

Minikube start/stop commands:

minikube start --driver docker --insecure-registry ${NET}
minikube stop

Kubectl commands:

kubectl get all
kubectl delete deploy/simple-deployment svc/simple-service

Hello Minikube:

kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.10
kubectl expose deployment hello-minikube --type=NodePort --port=8080
kubectl get pod
minikube service hello-minikube --url
curl <url>

Servers ports:

Gitea:              http://localhost:3000/
Jenkins:            http://localhost:8080/
Docker registry:    http://localhost:5000/
kubernetes Ingress: http://localhost:8000/

INTERNAL IP: ${OUTSIDE}

Ports forward:

bash /vagrant/scripts/ports-fwd.sh

KubeConfig:

kubectl config view --flatten

EOF
