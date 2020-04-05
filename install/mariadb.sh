#!/usr/bin/env bash

if [ $1 ] && [ $2 ] && [ $3 ] && [ $4 ] && [ $5 ];
    then
        debconf-set-selections <<< "mariadb-server-10.2 mysql-server/root_password password $2"
        debconf-set-selections <<< "mariadb-server-10.2 mysql-server/root_password_again password $2"
        apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
        add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://mirror.ufscar.br/mariadb/repo/10.2/ubuntu bionic main'
        
        apt-get install mariadb-server --yes

        mysql -u root --password="$2" << EOF
            DROP DATABASE IF EXISTS $1;
            CREATE DATABASE IF NOT EXISTS $1;
            CREATE USER IF NOT EXISTS '$3'@'$5' IDENTIFIED BY '$4';
            GRANT ALL PRIVILEGES ON $1.* TO '$3'@'$5' WITH GRANT OPTION;
            SET GLOBAL log_bin_trust_function_creators = 1;
            FLUSH PRIVILEGES;
            SHOW DATABASES;
            EXIT
        EOF
    

    else
        echo "Missing parameters.";
        echo "1st parameter is MySQL Magento database";
        echo "2nd parameter is MySQL root password";
        echo "3rd parameter is MySQL user password";
        echo "4rd parameter is MySQL user ";
        echo "5th parameter is MySQL host";
        echo "Try this: mysql.sh magento2 secret123";
        echo "FAILED";
fi;
