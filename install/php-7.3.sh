#!/usr/bin/env bash

echo -ne '\n' |  add-apt-repository ppa:ondrej/php

apt-get install \
    php7.3 \ 
    php7.3-pdo \
    php7.3-mysqlnd \ 
    php7.3-opcache \
    php7.3-xml \
    php7.3-gd \
    php7.3-devel 
    php7.3-mysql \
    php7.3-intl \
    php7.3-mbstring \
    php7.3-bcmath \
    php7.3-json \
    php7.3-iconv \
    php7.3-soap \
    
   --yes

service php7.3-fpm restart
