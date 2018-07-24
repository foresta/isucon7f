#/bin/bash

set -eu

echo "restarting nginx ..."

sudo nginx -t
sudo systemctl restart nginx

echo "DONE: nginx restarted"
