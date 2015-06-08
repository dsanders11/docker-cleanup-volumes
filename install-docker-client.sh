#!/bin/sh

# Copyright (c) 2014 Martin van Beurden

DOCKER_VERSION=1.4.1

# the docker package in alpine disables aufs and devicemapper
curl -sSL https://get.docker.com/builds/Linux/x86_64/docker-$DOCKER_VERSION -o /usr/bin/docker
chmod +x /usr/bin/docker

# cleanup
apk del curl && rm -rf /var/cache/apk/*
