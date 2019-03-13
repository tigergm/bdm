#!/bin/bash

set -e
set -x

BINDIR=$(dirname $0)
ROOT=${BINDIR%/*/*/*}

DOCKER_REGISTRY=${DOCKER_REGISTRY:-"docker-registry.infra.cloudera.com/huecontainer"}
BASEOS="ubuntu1604"
BASEIMAGE="${BASEOS}:base"
BASEDOCKER=${DOCKER_REGISTRY}/${BASEIMAGE}
BUILD_LOG=/var/log/hue-build.log

docker pull $BASEDOCKER 1>$BUILD_LOG 2>&1

WEBAPP_DIR=$BINDIR/container-build/webapp
HUE_BUILD=$WEBAPP_DIR/hue
mkdir -p $HUE_BUILD
docker run -it -v $ROOT/hue:/hue -v $HUE_BUILD:/usr/lib $BASEIMAGE sh -c "make install"
docker run -it -v $ROOT/hue:/hue -v $HUE_BUILD:/usr/lib $BASEIMAGE sh -c "./build/env/bin/pip install psycopg2-binary"

cd $WEBAPP_DIR
GBN=$(curl http://gbn.infra.cloudera.com/)
WEBAPPIMAGE="webapp:$GBN"
docker build -f Dockerfile -t $WEBAPPIMAGE .
docker tag $WEBAPPIMAGE $DOCKER_REGISTRY/$WEBAPPIMAGE 
docker push $DOCKER_REGISTRY/$WEBAPPIMAGE
