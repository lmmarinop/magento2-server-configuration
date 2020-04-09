#!/usr/bin/env bash

if [ $1 ];
  then
    cd /var/www/html/$1/webroot
    
    php bin/magento varnish:vcl:generate --access-list localhost --backend-host localhost --backend-port 8080 --export-version 6 --output-file var/default.vcl
    systemctl stop varnish
   
    mv /etc/varnish/default.vcl /etc/varnish/default.vcl.bckp
    cp /var/www/html/$1/webroot/var/default.vcl  /etc/varnish/default.vcl
    
    mv /etc/nginx/sites-available/$1 /etc/nginx/sites-available/no-ssl-current
    rm -rf /etc/nginx/sites-enabled/$1
    SITE=/etc/nginx/sites-available/$1
    curl https://raw.githubusercontent.com/lmmarinop/magento2-server-configuration/alternative-stack/config/nginx-site-varnish-ssl > $SITE

    sed -i "s/mywebshop.com/$1/" $SITE
    ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/

    systemctl start varnish
    service nginx reload
  
  else
    echo "";
    echo "1st parameter is magento domain";
    echo "Try this: varnish_ssl.sh mywebshop.com";
    echo "";
fi;
