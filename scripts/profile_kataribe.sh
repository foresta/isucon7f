#!/bin/bash

set -eu

cd `dirname $0`

. ./env.sh

sudo mkdir -p $TMP
cd $TMP
if [ ! -e kataribe ]; then
    # install
    sudo mkdir kataribe && cd kataribe
    sudo wget https://github.com/matsuu/kataribe/releases/download/v0.3.0/linux_amd64.zip && sudo unzip linux_amd64.zip && sudo rm linux_amd64.zip
fi

cd $TMP/kataribe
sudo sh -c "cat /var/log/nginx/access.log | ./kataribe -f kataribe.toml > $TMP/kataribe_profile.txt"



