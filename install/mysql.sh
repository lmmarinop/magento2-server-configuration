#!/usr/bin/env bash

if [ $1 ] && [ $2 ] && [ $3 ] && [ $4 ] && [ $5 ];
    then
        debconf-set-selections <<< "mysql-server mysql-server/root_password password $2"
        debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $2"
        wget http://repo.mysql.com/mysql-apt-config_0.8.14-1_all.deb
        echo -ne '\n' |  dpkg -i mysql-apt-config_0.8.14-1_all.deb
        apt-get update
        apt-get install mysql-server --yes

        service mysql start

        mysql -uroot -p$2 <<EOMYSQL
            DROP DATABASE IF EXISTS $1;
            CREATE DATABASE IF NOT EXISTS $1;
            CREATE USER IF NOT EXISTS '$3'@'$5' IDENTIFIED WITH 'mysql_native_password' BY '$4';
            GRANT ALL PRIVILEGES ON $1.* TO '$3'@'$5' WITH GRANT OPTION;
            SET PERSIST log_bin_trust_function_creators=1;
            SET persist enforce_gtid_consistency=on;
            SET persist_only gtid_mode=on;
            FLUSH PRIVILEGES;
            SHOW DATABASES;
            RESTART;
            EXIT
EOMYSQL

    else
        echo "Missing parameters.";
        echo "1st parameter is MySQL Magento database";
        echo "2nd parameter is MySQL root password";
        echo "Try this: mysql.sh magento2 secret123";
        echo "FAILED";
fi;
