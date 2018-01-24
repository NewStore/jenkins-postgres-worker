FROM jenkins/jnlp-slave:3.16-1-alpine
MAINTAINER Infrastructure team <team-infrastructure@newstore.com>

USER root

RUN apk add --update \
	postgresql \
    postgresql-dev \
    py3-virtualenv \ 
    make \
 && rm -rf /var/cache/apk/*

USER jenkins
