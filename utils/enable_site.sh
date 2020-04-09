#!/usr/bin/env bash

if [ $1 ];
  then
  ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/$1
  else
    echo "";
    echo "1st parameter is site domain";
fi;
