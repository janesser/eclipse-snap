#!/bin/bash
set -e

if [ -n $1 ]; then
    ECLIPSE_PACKAGE=$1
fi

export ECLIPSE_PACKAGE=${ECLIPSE_PACKAGE:='eclipse-java'}

. ./set-eclipse-package.sh

# snapcraft clean
# sudo less /var/snap/lxd/common/lxd/logs/lxd.log
snapcraft pack --debug

sudo snap install *.snap --dangerous

sudo snap connect $ECLIPSE_PACKAGE:personal-gitconfig
sudo snap connect $ECLIPSE_PACKAGE:personal-sshid
sudo snap connect $ECLIPSE_PACKAGE:personal-maven-cache
sudo snap connect $ECLIPSE_PACKAGE:personal-eclipse-config
sudo snap connect $ECLIPSE_PACKAGE:sources-dir
sudo snap connect $ECLIPSE_PACKAGE:git-cli git-confined:git-cli

# snap run $ECLIPSE_PACKAGE
