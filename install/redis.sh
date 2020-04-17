#!/usr/bin/env bash

apt-get install \
    redis-server \
    --yes
systemctl start redis
