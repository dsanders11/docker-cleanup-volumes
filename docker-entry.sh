#!/bin/sh

# If no arguments or the only supported arg, use the script
if [ $# -eq 0 ] || [ "$1" == "--dry-run" ] ; then
    /usr/local/bin/docker-cleanup-local-volumes.sh $1
else
    # Otherwise use whatever command was passed to us
    exec "$@"
fi
