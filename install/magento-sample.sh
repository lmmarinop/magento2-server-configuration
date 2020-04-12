#!/usr/bin/env bash

if [ $1 ] && [ $2 ] && [ $3 ] && [ $4 ] && [ $5 ] && [ $6 ] ;
    then
        echo "{\"http-basic\":{\"repo.magento.com\":{\"username\":\""$3"\", \"password\":\""$4"\"}}}" >> /var/www/html/$1/webroot/var/composer_home/auth.json

        cd /var/www/html/$1/webroot
        
        echo ${6} | su -c "php bin/magento cache:disable"

        chown -R $5:www-data .

        find . -type d -exec chmod 770 {} \;
        find . -type f -exec chmod 660 {} \;

        echo ${6} | su -c "php bin/magento sampledata:deploy"
        export COMPOSER_HOME=/var/www/html/$1/composer
        composer update
        echo ${6} | su -c "php bin/magento setup:upgrade"


        echo ${6} | su -c "php bin/magento setup:static-content:deploy $2 -f"

        echo ${6} | su -c "php bin/magento cache:clean"
        echo ${6} | su -c "php bin/magento cache:flush"

        chown -R $5:www-data .
        find . -type d -exec chmod 770 {} \;
        find . -type f -exec chmod 660 {} \;
        chmod u+x bin/magento
    else
        echo "";
        echo "1st parameter is magento domain";
        echo "2nd parameter is language code";
        echo "Try this: magento-sample.sh mywebshop.com";
        echo "";
fi;
