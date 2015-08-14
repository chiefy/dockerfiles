FROM alpine:latest

MAINTAINER Christopher 'Chief' Najewicz <chief@beefdisciple.com>

ENV MEDIAWIKI_DL=http://releases.wikimedia.org/mediawiki/1.25/mediawiki-1.25.2.tar.gz

RUN apk update

RUN apk add \
		php \
		php-curl \
		php-xml \
		php-fpm \
		php-ctype \
		php-gd \
		php-json \
		php-mysqli \
		php-pdo_mysql \
		php-dom \
		php-openssl \
		php-iconv \
		php-xcache \
		php-intl \
		php-mcrypt \
		php-common

RUN rm -rf /var/cache/apk/*

RUN sed -i \
 -e "s,expose_php = On,expose_php = Off,g" \
 -e "s,;cgi.fix_pathinfo=1,cgi.fix_pathinfo=0,g" \
 -e "s,post_max_size = 8M,post_max_size = 100M,g" \
 -e "s,upload_max_filesize = 2M,upload_max_filesize = 100M,g" \ 
 /etc/php/php.ini 

RUN sed -i \
 -e "s,;daemonize = yes,daemonize = no,g" \
 -e "s,user = nobody,user = www,g" \
 -e "s,;chdir = /var/www,chdir = /var/www/mediawiki,g" \
 -e "s,;listen.owner = nobody,listen.owner = www,g" \
 -e "s,;listen.group = nobody,listen.group = www,g" \
 -e "s,listen = 127.0.0.1:9000,listen = 0.0.0.0:9000,g" \
 /etc/php/php-fpm.conf 

RUN sed -i "s,;extension=xcache.so,extension=xcache.so," /etc/php/conf.d/xcache.ini

# forward logs to docker log collector
RUN ln -sf /dev/stdout /var/log/php-fpm.log

ADD $MEDIAWIKI_DL /tmp/
RUN mkdir -p /var/www \
	&& cd /tmp \
	&& tar -C /var/www -xzvf ./mediawiki*.tar.gz \
	&& mv /var/www/mediawiki* /var/www/mediawiki

RUN adduser -S -D -H www
RUN chown -R www /var/www/mediawiki

USER www
RUN echo "<?php phpinfo(); ?>" > /var/www/mediawiki/index_test.php

USER root

WORKDIR /var/www/mediawiki

VOLUME /var/www/mediawiki

EXPOSE 9000

ENTRYPOINT ["php-fpm","-F"]
