#!/bin/bash

OUTPUT="${OUTPUT:-/output}"
echo "==== PYTHON=$PYTHON DIR=$OUTPUT"

set -e
set -x

cp -rp $OUTPUT/libyaml.git /tmp/
cd /tmp/libyaml.git

./bootstrap
./configure
make test
sudo make install
sudo ldconfig

git clone https://github.com/yaml/pyyaml.git /tmp/pyyaml
cd /tmp/pyyaml
$PYTHON --version
$PYTHON setup.py test

echo "$PYTHON pyyaml successful"

