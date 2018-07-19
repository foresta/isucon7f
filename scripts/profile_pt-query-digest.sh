#!/bin/bash

set -eu

source ./env.sh

sudo mkdir -p $TMP
cd $TMP

if [ ! -e percona-toolkit ]; then
    # インストール
    sudo wget percona.com/get/percona-toolkit.tar.gz && sudo tar zxvf percona-toolkit.tar.gz && sudo rm percona-toolkit.tar.gz
    sudo mv percona-toolkit-* percona-toolkit
fi

cd percona-toolkit/bin
sudo sh -c "./pt-query-digest --type slowlog /var/log/mysql/mysql-slow.log --explain h=localhost,u=root > pt-log.txt"
