#!/usr/bin/env bash

if [ $1 == "6" ];
then

curl -s https://packagecloud.io/install/repositories/varnishcache/varnish60lts/script.deb.sh | sudo bash

apt-get install \
    varnish-dev=6.0.6-1~bionic \
    --yes

service varnish restart
else
    apt-get install \
        varnish
        --yes

    service varnish restart

fi;
