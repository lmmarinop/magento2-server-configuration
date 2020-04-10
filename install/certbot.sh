#!/usr/bin/env bash

echo -ne '\n' |  add-apt-repository ppa:certbot/certbot

apt-get update

apt-get install \
    software-properties-common \
    certbot \
    python-certbot-nginx \
    --yes
