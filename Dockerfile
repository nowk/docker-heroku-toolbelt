FROM debian:jessie
MAINTAINER Yung Hwa Kwon <yung.kwon@damncarousel.com>

# install deps
RUN apt-get update && apt-get install -y \
	wget \
	ruby

# install heroku-client via apt-get and clean up
RUN echo "deb http://toolbelt.heroku.com/ubuntu ./" > /etc/apt/sources.list.d/heroku.list \
	&& wget -O- https://toolbelt.heroku.com/apt/release.key | apt-key add - \
	&& apt-get update && apt-get install -y \
	heroku-toolbelt \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# update heroku-client
# ignore message to update via apt-get install heroku-client
RUN heroku update > /dev/null; return 0

ENTRYPOINT [ "/usr/bin/heroku" ]
CMD [ "--help" ]
