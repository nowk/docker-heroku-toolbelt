FROM nowk/alpine-bare:3.2
MAINTAINER Yung Hwa Kwon <yung.kwon@damncarousel.com>

RUN apk --update add \
	openresolv \
	openssl \
	ruby ruby-json \
	&& rm -rf /var/cache/apk/*

# can't run this due to sudo
# wget -O- https://toolbelt.heroku.com/install.sh | sh
#
RUN mkdir /opt && cd /opt \
	&& wget -qO- https://s3.amazonaws.com/assets.heroku.com/heroku-client/heroku-client.tgz | tar xz

COPY ./docker-entrypoint /
ENTRYPOINT [ "/docker-entrypoint" ]

