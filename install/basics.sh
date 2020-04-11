#!/usr/bin/env bash

sed -i "s/.*#*ClientAliveInterval.*/ClientAliveInterval 1m/" /etc/ssh/sshd_config
sed -i "s/.*#*ClientAliveCountMax.*/ClientAliveCountMax 3000/" /etc/ssh/sshd_config


apt-get install \
    git \
    curl \
    vim \
    unzip \
    --yes
