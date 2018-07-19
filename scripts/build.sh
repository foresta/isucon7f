#!/bin/bash

set -eu

source ./env.sh

echo $WEBAPP_DIR
cd $WEBAPP_DIR
make
