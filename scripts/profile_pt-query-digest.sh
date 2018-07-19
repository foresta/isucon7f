#!/bin/bash

set -eu

source ./env.sh

mkdir -p $TMP
cd $TMP

if [ ! -e percona-toolkit ]; then
    # インストール
    wget percona.com/get/percona-toolkit.tar.gz && tar zxvf percona-toolkit.tar.gz && rm percona-toolkit.tar.gz
    mv percona-toolkit-* percona-toolkit
fi

cd percona-toolkit/bin
sudo ./pt-query-digest --type slowlog /var/lib/mysql/ip-10-0-0-226-slow.log --explain h=localhost,u=root > pt-log.txt
