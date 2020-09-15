#!/usr/bin/env bash

docker build -t jenkins-master /vagrant/jenkins/master

docker build -t jenkins-slave /vagrant/jenkins/slave
