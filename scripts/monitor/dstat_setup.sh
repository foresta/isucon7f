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

set_alias() {
    echo "" >> ~/.bashrc
    echo "alias dstat-full='dstat -Tclmdrn'" >> ~/.bashrc
    echo "alias dstat-mem='dstat -Tclm'" >> ~/.bashrc
    echo "alias dstat-cpu='dstat -Tclr'" >> ~/.bashrc
    echo "alias dstat-net='dstat -Tclnd'" >> ~/.bashrc
    echo "alias dstat-disk='dstat -Tcldr'" >> ~/.bashrc
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

set_alias

