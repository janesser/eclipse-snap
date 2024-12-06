#!/bin/bash
set -e

ECLIPSE_PACKAGE=$1
export ECLIPSE_PACKAGE=${ECLIPSE_PACKAGE:='eclipse-java'}

./set-eclipse-package.sh

# snapcraft clean
# sudo less /var/snap/lxd/common/lxd/logs/lxd.log
snapcraft try --debug

sudo snap try prime # --devmode

sudo snap connect $ECLIPSE_PACKAGE:personal-git-global
sudo snap connect $ECLIPSE_PACKAGE:personal-maven-cache
sudo snap connect $ECLIPSE_PACKAGE:personal-eclipse-config
sudo snap connect $ECLIPSE_PACKAGE:sources-dir

snap run $ECLIPSE_PACKAGE