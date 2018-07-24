#/bin/bash

set -eu

on() {
    sudo mysql -uroot -e "set global slow_query_log_file = '/var/log/mysql/mysql-slow.log';"
    sudo mysql -uroot -e "set global long_query_time = 0;"
    sudo mysql -uroot -e "set global slow_query_log = ON;"
}

off() {
     sudo mysql -uroot -e "set global long_query_time = 10;"
     sudo mysql -uroot -e "set global slow_query_log = OFF;"
}

if [ "$1" = "off" ]; then
    off
else
    on
fi
