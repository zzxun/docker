#
# docker build -t zzxun/shadowsocks .
# docker run -d -it -p 443:443 -p 443:443/udp zzxun/shadowsocks
# 
# docker pull oddrationale/docker-shadowsocks
# docker run -d -p 8443:1984 oddrationale/docker-shadowsocks -s 0.0.0.0 -p 1984 -k fuckgfw -m aes-256-cfb
# ckerfile for shadowsocks-libev
#

FROM alpine
MAINTAINER EasyPi Software Foundation

ENV SS_VER 2.4.6
ENV SS_URL https://github.com/shadowsocks/shadowsocks-libev/archive/v$SS_VER.tar.gz
ENV SS_DIR shadowsocks-libev-$SS_VER
ENV SS_DEP autoconf build-base curl libtool linux-headers openssl-dev

RUN set -ex \
    && apk add --update $SS_DEP \
    && curl -sSL $SS_URL | tar xz \
    && cd $SS_DIR \
        && ./configure \
        && make install \
        && cd .. \
        && rm -rf $SS_DIR \
    && apk del --purge $SS_DEP \
    && rm -rf /var/cache/apk/*

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 443
ENV PASSWORD=
ENV METHOD      aes-256-cfb
ENV TIMEOUT     300
ENV DNS_ADDR    8.8.8.8

EXPOSE $SERVER_PORT/tcp
EXPOSE $SERVER_PORT/udp

CMD ss-server -s $SERVER_ADDR \
              -p $SERVER_PORT \
              -k fuckgfw \
              -m $METHOD \
              -t $TIMEOUT \
              --fast-open \
              -d $DNS_ADDR \
              -u \
              -A