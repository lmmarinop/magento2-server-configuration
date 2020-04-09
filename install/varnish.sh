#!/usr/bin/env bash

curl -s https://packagecloud.io/install/repositories/varnishcache/varnish64/script.deb.sh | sudo bash

apt-get install \
    varnish=6.4.0-1~bionic \
    --yes

service varnish restart
