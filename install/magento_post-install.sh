#!/usr/bin/env bash

if [ $1 ];
  then
   cd /var/www/html/$1/webroot
   magento config:set catalog/search/engine 'elasticsearch6'
   
else
    echo "";
    echo "1st parameter is magento domain";
    echo "Try this: varnish_ssl.sh mywebshop.com";
    echo "";
fi;
