#!/bin/bash
set -e

if [ -n $1 ]; then
    ECLIPSE_PACKAGE=$1
fi

export ECLIPSE_PACKAGE=${ECLIPSE_PACKAGE:='eclipse-java'}
export ECLIPSE_CONFINED=${ECLIPSE_CONFINED:=false}

export SNAP_NAME=$ECLIPSE_PACKAGE
if $ECLIPSE_CONFINED; then
    export SNAP_PREFIX="janesser-"
    export SNAP_NAME="$SNAP_PREFIX$ECLIPSE_PACKAGE"
fi

. ./set-eclipse-package.sh

CLEAN=${CLEAN:=false}

if $CLEAN; then
    sudo snap remove --purge $SNAP_NAME
    snapcraft clean
fi

# sudo less /var/snap/lxd/common/lxd/logs/lxd.log
snapcraft pack --debug

if $ECLIPSE_CONFINED; then
    sudo snap install ./$(echo $SNAP_NAME)_*_$(dpkg --print-architecture).snap --dangerous
    sudo snap connect $SNAP_NAME:personal-gitconfig
    sudo snap connect $SNAP_NAME:personal-maven-cache
    sudo snap connect $SNAP_NAME:hugepages-control
    sudo snap connect $SNAP_NAME:ssh-keys
else
    sudo snap install ./$(echo $SNAP_NAME)_*_$(dpkg --print-architecture).snap --dangerous --classic
fi

AUTORUN=${AUTORUN:=false}
if $AUTORUN; then
    snap run $SNAP_NAME &
fi
