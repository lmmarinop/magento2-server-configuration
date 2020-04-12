#!/usr/bin/env bash

apt-get install \
    php \
    php-fpm \
    php-opcache \
    php-mysql \
    php-curl \
    php-cli \
    php-gd \
    php-xsl \
    php-json \
    php-intl \
    php-pear \
    php-dev \
    php-common \
    php-soap \
    php-mbstring \
    php-zip \
    php-bcmath \
    php-imagick \
    php-xml \
    --yes


service php7.3-fpm restart
