#/bin/bash

set -eu

source ./env.sh

echo $WEBAPP_DIR
cd $WEBAPP_DIR
ps aux | grep $APPNAME | grep -v grep | awk '{ print "kill -9", $2 }' | sh
./$APPNAME &
