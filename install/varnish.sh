#!/usr/bin/env bash


curl -s https://packagecloud.io/install/repositories/varnishcache/varnish60lts/script.deb.sh | sudo bash

apt-get install varnish-dev=6.0.6-1~bionic \
    --yes

service varnish restart

