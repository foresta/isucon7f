#/bin/bash

set -eu

. ./env.sh

sudo systmctl restart cco.golang.service
