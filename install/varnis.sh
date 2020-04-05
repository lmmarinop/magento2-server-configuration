#!/usr/bin/env bash

apt-get install \
    varnish \
    --yes

service varnish restart
