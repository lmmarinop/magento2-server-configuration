#!/usr/bin/env bash


curl -s https://packagecloud.io/install/repositories/varnishcache/varnish64/script.deb.sh | sudo bash

sudo apt-get install varnish=6.4.0-1~buster --yes

service varnish restart

