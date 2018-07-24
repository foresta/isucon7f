#!/bin/bash

CURRENT_DIR=$(cd $(dirname $0) && pwd)

apt() {
    sudo apt-get install -y dstat
}

yum() {
    sudo yum --enablerepo=epel install -y dstat
}

patch_innodb_ops() {
    sudo patch -u /usr/share/dstat/dstat_innodb_ops.py < "${CURRENT_DIR}/dstat_innodb_ops.py.patch"
}

if [ -n "$(which dstat)" ]; then
    echo "dstat already installed"
    exit
fi

if [ -n "$(which apt-get)" ]; then
    apt
elif [ -n "$(which yum)" ]; then
    yum
fi

patch_innodb_ops

