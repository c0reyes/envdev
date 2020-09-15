#!/usr/bin/env bash

[ ! -d /vagrant/registry/data ] && mkdir /vagrant/registry/data

cd /vagrant/registry/nginx

export SAN="DNS:registry, DNS:localhost, DNS:host.minikube.internal"

openssl req -x509 -out domain.crt -keyout domain.key \
  -newkey rsa:2048 -nodes -sha256 -days 365\
  -subj '/CN=localhost' -extensions EXT -config <( \
   printf "[dn]\nCN=localhost\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=${SAN}\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")

mkdir -p "/etc/docker/certs.d/registry:5043/"
mkdir -p "/etc/docker/certs.d/localhost:5043/"
mkdir -p "/etc/docker/certs.d/host.minikube.internal:5043/"

cp domain.crt "/etc/docker/certs.d/registry:5043/ca.crt"
cp domain.crt "/etc/docker/certs.d/localhost:5043/ca.crt"
cp domain.crt "/etc/docker/certs.d/host.minikube.internal:5043/ca.crt"

docker run --rm --entrypoint htpasswd registry:2.7.0 -Bbn testuser testpassword > nginx.htpasswd

grep "127.0.0.1 registry" /etc/hosts || echo "127.0.0.1 registry" | tee -a /etc/hosts

# insecure registry
cp /vagrant/registry/daemon.json /etc/docker/daemon.json
