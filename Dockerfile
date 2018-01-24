FROM jenkins/jnlp-slave:3.16-1
MAINTAINER Infrastructure team <team-infrastructure@newstore.com>

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
	postgresql-9.6 \
    virtualenv \
	&& rm -rf /var/lib/apt/lists/*

USER jenkins
