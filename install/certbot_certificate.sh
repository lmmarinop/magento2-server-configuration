#!/usr/bin/env bash

sudo certbot -n -d $1 --nginx --agree-tos --email $2


