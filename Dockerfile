FROM jenkins/jnlp-slave:3.16-1-alpine
MAINTAINER Infrastructure team <team-infrastructure@newstore.com>

USER root

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.5/main' >> /etc/apk/repositories && apk update \
 && apk add \
	postgresql==9.6.6-r0 \
    postgresql-dev==9.6.6-r0 \
    py3-virtualenv \ 
    python3-dev \
    py3-psycopg2 \
    build-base \
    perl \
 && rm -rf /var/cache/apk/*

USER jenkins
