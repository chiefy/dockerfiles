FROM alpine:3.3

MAINTAINER Christopher 'Chief' Najewicz <chief@beefdisciple.com>

ENV VERSION=v4.3.1

ENV CONFIG_FLAGS="--fully-static --without-snapshot" DEL_PKGS="libgcc libstdc++" RM_DIRS=/usr/include

WORKDIR /root

ADD build.sh build.sh

RUN chmod +x ./build.sh \
  && sync \
  && VERSION=${VERSION} ./build.sh \
  && rm ./build.sh
