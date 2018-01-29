FROM jenkins/jnlp-slave:3.16-1-alpine
MAINTAINER Infrastructure team <team-infrastructure@newstore.com>

USER root

ENV PATH /usr/lib/postgresql/$PG_MAJOR/bin:$PATH
ENV PGDATA /var/lib/postgresql/data

ENV LANG en_US.utf8

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.5/main' >> /etc/apk/repositories && apk update \
 && apk add \
    readline-dev \
    libressl-dev \
    zlib-dev \
    libxml2-dev \
    glib-lang \
	postgresql==9.6.6-r0 \
    postgresql-dev==9.6.6-r0 \
    postgresql-contrib==9.6.6-r0 \
    py3-virtualenv \ 
    python3-dev \
    py3-psycopg2 \
    findutils \
    perl \
    wget \
    gnupg \
    ca-certificates \
    su-exec \
    build-base && \
    gpg --keyserver ipv4.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 && \
    gpg --list-keys --fingerprint --with-colons | sed -E -n -e 's/^fpr:::::::::([0-9A-F]+):$/\1:6:/p' | gpg --import-ownertrust && \
    wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64" && \
    wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64.asc" && \
    gpg --verify /usr/local/bin/gosu.asc && \
    rm /usr/local/bin/gosu.asc && \
    chmod +x /usr/local/bin/gosu && \
    apk --purge del openssl-dev zlib-dev libxml2-dev gnupg ca-certificates && \
    rm -rf /var/cache/apk/*

USER jenkins
