#!/usr/bin/env bash

if [ $1 ] && [ $2 ] && [ $3 ] && [ $4 ] && [ $5 ];
    then

        debconf-set-selections <<< "mariadb-server-10.4 mysql-server/root_password password $2"
        debconf-set-selections <<< "mariadb-server-10.4 mysql-server/root_password_again password $2"

        sudo apt-get install software-properties-common
        apt-key adv --fetch-keys "https://mariadb.org/mariadb_release_signing_key.asc"
        sudo add-apt-repository 'deb [arch=amd64] https://mirror.serverion.com/mariadbrepo/10.4/ubuntu eoan main'

        sudo apt update
        apt-get install mariadb-server --yes

        service mysql start

        mysql -uroot -p$2 <<EOMYSQL
            DROP DATABASE IF EXISTS $1;
            CREATE DATABASE IF NOT EXISTS $1;
            CREATE USER IF NOT EXISTS '$3'@'$5' IDENTIFIED BY '$4';
            GRANT ALL PRIVILEGES ON $1.* TO '$3'@'$5' WITH GRANT OPTION;
            SET GLOBAL log_bin_trust_function_creators = 1;
            SET PERSIST log_bin_trust_function_creators=1;
            SET persist enforce_gtid_consistency=on;
            SET persist_only gtid_mode=on;
            FLUSH PRIVILEGES;
            SHOW DATABASES;
            EXIT
        EOMYSQL


    else
        echo "Missing parameters.";
        echo "1st parameter is MySQL Magento database";
        echo "2nd parameter is MySQL root password";
        echo "Try this: mysql.sh magento2 secret123";
        echo "FAILED";
fi;
