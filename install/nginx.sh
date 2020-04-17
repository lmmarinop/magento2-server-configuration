#!/usr/bin/env bash

apt update
apt-get install \
    nginx \
    --yes

service nginx restart
