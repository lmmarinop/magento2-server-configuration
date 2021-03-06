#!/usr/bin/env bash

echo -ne '\n' |  add-apt-repository ppa:ondrej/php

apt-get update

apt-get install php7.3 php-imagick php7.3-zip php7.3-fpm php7.3-curl php7.3-cli php7.3-opcache php7.3-xml php7.3-gd php7.3-mysql php7.3-intl php7.3-mbstring php7.3-bcmath php7.3-json  php7.3-common  php7.3-soap  --yes

service php7.3-fpm restart
