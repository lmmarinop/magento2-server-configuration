
#!/usr/bin/env bash

curl https://TOKEN:@packagecloud.io/varnishplus/60/gpgkey | apt-key add -
echo "deb https://packagecloud.io/varnishcache/varnish60lts/ubuntu/ bionic main" | sudo tee -a /etc/apt/sources.list.d/varnishcache_varnish60lts.list

apt-get install \
    varnish \
    --yes

service varnish restart
