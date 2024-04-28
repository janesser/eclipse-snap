#!/bin/bash
SOURCE=$(dirname -- ${BASH_SOURCE[0]})
echo source-root: $SOURCE

ECLIPSE_PACKAGE=${ECLIPSE_PACKAGE:='eclipse-java'}

SNAPCRAFT_YAML=$SOURCE/snap/snapcraft.yaml

YGLU_ENABLE_ENV=true pipx run yglu snapcraft.yaml.template | tee $SNAPCRAFT_YAML

echo written $SNAPCRAFT_YAML for $ECLIPSE_PACKAGE.
