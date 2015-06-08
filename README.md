# docker-cleanup-volumes

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/dsanders11/docker-cleanup-volumes/master/LICENSE)

## Overview

A fork of Martin van Beurden's great [docker-cleanup-volumes.sh] script to delete orphaned [Docker] volumes.

This fork focuses solely on being run as a Docker container since this allows it to work in any Docker host situation (such as [boot2docker]).

Since the full Docker command is a bit unwieldy, there's a wrapper script which is perfect for dropping in `/usr/local/bin`.

### Wrapper Script Usage

Drop the wrapper script (`docker-cleanup-volumes`) into `/usr/local/bin` and then use it as such:

    $ docker-cleanup-volumes [--dry-run]

### Docker Image Usage

If you'd prefer to run the image manually, the following command is the same as from the wrapper script:

    $ docker run -e DOCKER_CERT_PATH=$DOCKER_CERT_PATH -e DOCKER_TLS_VERIFY=$DOCKER_TLS_VERIFY -e DOCKER_HOST=$DOCKER_HOST -v $DOCKER_CERT_PATH:$DOCKER_CERT_PATH -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --rm dsanders11/docker-cleanup-volumes[:client-version] [--dry-run]

(Told you it was unwieldy)

### Other Improvements

In addition to working with `boot2docker` the Dockerfile has been tweaked to make better use of layer caching and the wrapper script auto detects which version of the Docker client you're using.

[docker-cleanup-volumes.sh]: https://github.com/chadoe/docker-cleanup-volumes "Martin van Beurden's docker-cleanup-volumes.sh"
[Docker]: https://www.docker.com/ "Docker - Build, Ship, and Run Any App, Anywhere"
[boot2docker]: http://boot2docker.io/ "Lightweight Linux for Docker"
