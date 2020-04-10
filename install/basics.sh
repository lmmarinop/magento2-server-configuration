#!/usr/bin/env bash
sed -i "s/*ClientAliveInterval.*/ClientAliveInterval 60/" /etc/ssh/sshd_config
sed -i "s/*ClientAliveCountMax.*/ClientAliveCountMax 30/" /etc/ssh/sshd_config
systemctl reload sshd

apt-get install \
    git \
    curl \
    vim \
    unzip \
    --yes
