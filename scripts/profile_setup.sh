#!/bin/bash

set -ue

cd `dirname $0`

. ./env.sh

on() {
    sh ./profile/slow_query.sh on
    sh ./profile/nginx_for_kataribe.sh on
}

off() {
    sh ./profile/slow_query.sh off
    sh ./profile/nginx_for_kataribe.sh off
}

if [ "$1" = "off" ]; then
    off
else
    on
fi
