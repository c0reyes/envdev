#!/usr/bin/env bash

sudo apt install -y conntrack

curl -s -q -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

curl -s -q -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin/

echo "127.0.0.1 minikube minikube." | sudo tee -a /etc/hosts

cat <<EOF | tee -a /home/vagrant/.bashrc
source <(kubectl completion bash)
EOF

#sudo swapoff -a
#cat /etc/fstab | grep -v swap | sudo tee /etc/fstab
#echo vm.swappiness=0 | sudo tee -a /etc/sysctl.conf

NET=$(ip -4 addr show dev docker0 | grep inet | awk '{print $2}')

su - vagrant -c "minikube start --driver docker --insecure-registry ${NET}"
su - vagrant -c "minikube kubectl -- get pods -A"
su - vagrant -c "minikube addons enable ingress"
