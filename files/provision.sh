#!/bin/bash

# workaround to avoid having apt-get run too early in the boot process, to avoid failure.
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

sudo apt-get -qq update
sudo apt-get install -yq nginx
cat >/tmp/myfile.txt << "EOF"
Here will come more details soon
EOF