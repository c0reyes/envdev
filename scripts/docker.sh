#!/usr/bin/env bash

apt install -y apt-transport-https ca-certificates software-properties-common
curl -s https://download.docker.com/linux/debian/gpg | apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee -a /etc/apt/sources.list.d/docker.list

apt update
apt install -y docker-ce docker-ce-cli docker-compose
systemctl enable docker
systemctl start docker
usermod -aG docker vagrant && newgrp docker
