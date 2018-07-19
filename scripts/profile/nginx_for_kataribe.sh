#/!bin/bash

set -eu

source ./env.sh

on() {
    sed -i -e "s/access_log off;/access_log \/var\/log\/nginx\/access.log;/" $NGINX_CONF_PATH
    rm -f nginx.conf-e
}

off() {
    sed -i -e "s/access_log \/var\/log\/nginx\/access.log;/access_log off;/" $NGINX_CONF_PATH
    rm -f nginx.conf-e
}

if [ "$1" = "off" ]; then
    off
else
    on
fi

sh ../restart_nginx.sh
