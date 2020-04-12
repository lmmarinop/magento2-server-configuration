#!/usr/bin/env bash

    
   wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
   apt-get install apt-transport-https
   echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list


   apt-get install default-jdk -y
   update-alternatives --config java
   set JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
   echo 'export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"' | sudo tee -a ~/.profile

    sudo apt-get update --yes
    
    apt-get install \
    elasticsearch \
    --yes
    
    sed -i "s/-Xms.*/-Xms512m/" /etc/elasticsearch/jvm.options
    sed -i "s/-Xmx.*/-Xmx512m/" /etc/elasticsearch/jvm.options
    
    systemctl daemon-reload
    systemctl enable elasticsearch.service
    systemctl restart elasticsearch.service
