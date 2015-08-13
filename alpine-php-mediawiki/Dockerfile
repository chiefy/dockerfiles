FROM alpine:latest

MAINTAINER Christopher 'Chief' Najewicz <chief@beefdisciple.com>

RUN apk update

RUN apk add \
		php \
		php-curl \
		php-xml \
		php-fpm \
		php-gd \
		php-json \
		php-pdo_mysql \
		php-dom \
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
 -e "s,goup = nobody,group = www,g" \
 -e "s,;listen.owner = nobody,listen.owner = www,g" \
 -e "s,;listen.group = nobody,listen.group = www,g" \
 -e "s,listen = 127.0.0.1:9000,listen = 0.0.0.0:9000,g" \
 /etc/php/php-fpm.conf 

# forward logs to docker log collector
RUN ln -sf /dev/stdout /var/log/php-fpm.log

RUN adduser -S -D -H www

ADD https://releases.wikimedia.org/mediawiki/1.25/mediawiki-1.25.1.tar.gz /var/www/mediawiki/

RUN mkdir -p /var/www/mediawiki && chown -R www. /var/www/mediawiki

USER www

RUN echo "<?php phpinfo(); ?>" > /var/www/mediawiki/index_test.php

WORKDIR /var/www/mediawiki

EXPOSE 9000

ENTRYPOINT ["php-fpm","-F"]
