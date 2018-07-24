#/bin/bash

set -eu

echo "restarting nginx ..."

sudo nginx -t
sudo service nginx restart

echo "DONE: nginx restarted"
