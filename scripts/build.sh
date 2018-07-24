#!/bin/bash

set -eu

. ./env.sh

echo $WEBAPP_DIR
cd $WEBAPP_DIR
make
