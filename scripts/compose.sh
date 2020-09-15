#!/usr/bin/env bash

export OUTSIDE=$(ip -4 addr show scope global dev docker0 | grep inet | awk '{print $2}' | cut -d / -f 1)

docker-compose -f /vagrant/docker-compose.yml up -d
