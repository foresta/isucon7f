#/bin/bash

set -eu

sudo nginx -t
sudo service nginx restart
