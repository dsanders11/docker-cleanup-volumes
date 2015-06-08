FROM alpine:3.1

MAINTAINER David Sanders <dsanders11@ucsbalum.com>

# Install dependencies first for layer caching
RUN apk add --update-cache curl bash grep

# This is here first for maximum layer caching
ENTRYPOINT [ "/home/docker/docker-entry.sh" ]

# Add the Docker entrypoint
ADD docker-entry.sh /home/docker/docker-entry.sh

# Add the cleanup script
ADD docker-cleanup-local-volumes.sh /usr/local/bin/

# Add the install Docker client script
ADD install-docker-client.sh /home/docker/install-docker-client.sh

# This comes last as it changes per branch
RUN /home/docker/install-docker-client.sh
