#!/usr/bin/env bash

if [ $1 ];
  then
   cd /var/www/html/$1/webroot
  bin/magento config:set catalog/search/engine 'elasticsearch6'
  echo "yes":"yes" | bin/magento setup:config:set --page-cache=redis --page-cache-redis-server=127.0.0.1 --page-cache-redis-port=6379 --page-cache-redis-db=1
   
else
    echo "";
    echo "1st parameter is magento domain";
    echo "Try this: varnish_ssl.sh mywebshop.com";
    echo "";
fi;
