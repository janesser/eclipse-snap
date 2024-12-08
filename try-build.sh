#!/bin/bash
set -e

if [ -n $1 ]; then
    ECLIPSE_PACKAGE=$1
fi

export ECLIPSE_PACKAGE=${ECLIPSE_PACKAGE:='eclipse-java'}

. ./set-eclipse-package.sh

# snapcraft clean
# sudo less /var/snap/lxd/common/lxd/logs/lxd.log
snapcraft try --debug

sudo snap try prime # --devmode

sudo snap connect $ECLIPSE_PACKAGE:personal-gitconfig
sudo snap connect $ECLIPSE_PACKAGE:personal-sshid
sudo snap connect $ECLIPSE_PACKAGE:personal-maven-cache
sudo snap connect $ECLIPSE_PACKAGE:personal-eclipse-config
sudo snap connect $ECLIPSE_PACKAGE:sources-dir
sudo snap connect $ECLIPSE_PACKAGE:git-plug git-confined

# snap run $ECLIPSE_PACKAGE