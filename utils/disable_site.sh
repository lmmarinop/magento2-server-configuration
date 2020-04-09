#!/usr/bin/env bash

if [$1];
then
rm -rf /etc/nginx/sites-enabled/$1
fi;
