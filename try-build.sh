#!/bin/bash
set -e

if [ -n $1 ]; then
    ECLIPSE_PACKAGE=$1
fi

export ECLIPSE_PACKAGE=${ECLIPSE_PACKAGE:='eclipse-java'}

. ./set-eclipse-package.sh

CLEAN=${CLEAN:=false}

if $CLEAN; then
    sudo snap remove --purge $ECLIPSE_PACKAGE
    snapcraft clean
fi

# sudo less /var/snap/lxd/common/lxd/logs/lxd.log
snapcraft pack --debug

sudo snap install $ECLIPSE_PACKAGE*.snap --dangerous

sudo snap connect $ECLIPSE_PACKAGE:personal-sourcedir
sudo snap connect $ECLIPSE_PACKAGE:personal-workspace

sudo snap connect $ECLIPSE_PACKAGE:personal-gitconfig
sudo snap connect $ECLIPSE_PACKAGE:personal-sshid
sudo snap connect $ECLIPSE_PACKAGE:personal-maven-cache

AUTORUN=${AUTORUN:=false}
if $AUTORUN; then
    snap run $ECLIPSE_PACKAGE &
fi
