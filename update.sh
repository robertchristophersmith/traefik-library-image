#!/bin/sh

set -e

if [ $# -eq 0 ] ; then
	echo "Usage: ./update.sh <traefik tag or branch>"
	exit
fi

export VERSION=$1
export ALPINE_VERSION=3.6

# cd to the current directory so the script can be run from anywhere.
cd `dirname $0`

echo "Replace $VERSION in Dockerfiles..."
envsubst < Dockerfile.tmpl > Dockerfile
envsubst < alpine/Dockerfile.tmpl > alpine/Dockerfile

echo "Done."
