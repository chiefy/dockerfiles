FROM quay.io/pires/alpine-linux-build:latest

MAINTAINER Christopher 'Chief' Najewicz <chief@beefdisciple.com>

RUN apk update; apk add mercurial libc-dev gcc bash zip

RUN echo -e "[trusted]\nusers = root, 1000\n" > /root/.hgrc
