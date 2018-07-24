#/!bin/bash

set -eu

cd `dirname $0`
DIR=$(pwd)

. $DIR/../env.sh

on() {
    sudo sed -i -e "s/access_log off;/access_log \/var\/log\/nginx\/access.log with_time;/" $NGINX_CONF_PATH
    sudo rm -f nginx.conf-e
    sudo sh -c "echo '' > /var/log/nginx/access.log"
}

off() {
    sudo sed -i -e "s/access_log \/var\/log\/nginx\/access.log with_time;/access_log off;/" $NGINX_CONF_PATH
    sudo rm -f nginx.conf-e
}

if [ "$1" = "off" ]; then
    off
else
    on
fi

sh ../restart_nginx.sh
