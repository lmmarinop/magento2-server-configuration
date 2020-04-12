#!/usr/bin/env bash

if [ $1 ] && [ $2 ];
  then
    cd /var/www/html/$1/webroot
    
    php bin/magento config:set system/full_page_cache/caching_application 2
    php bin/magento varnish:vcl:generate --access-list localhost --backend-host localhost --backend-port 8080 --export-version $2 --output-file var/default.vcl
    mv /etc/varnish/default.vcl /etc/varnish/default.vcl.bckp
    cp /var/www/html/$1/webroot/var/default.vcl  /etc/varnish/default.vcl
    
    rm -rf /etc/nginx/sites-available/$1
    SITE=/etc/nginx/sites-available/$1
    curl https://raw.githubusercontent.com/lmmarinop/magento2-server-configuration/alternative-stack/config/nginx-site-varnish-ssl > $SITE

    sed -i "s|/pub/health_check.php|/health_check.php|" /etc/varnish/default.vcl
    sed -i "s/mywebshop.com/$1/" $SITE
    
    ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/

    systemctl restart varnish
    systemctl restart nginx 
    systemctl reload  nginx 
  
  else
    echo "";
    echo "1st parameter is magento domain";
    echo "2nd parameter is varnish version";
    echo "Try this: varnish_ssl.sh mywebshop.com";
    echo "";
fi;
