FROM alpine:3.6

ENV VERSION=v8.9.1

ENV CONFIG_FLAGS="--fully-static --without-snapshot" DEL_PKGS="libgcc libstdc++" RM_DIRS=/usr/include

WORKDIR /root

ADD build.sh build.sh

RUN chmod +x ./build.sh \
	&& sync \
	&& VERSION=${VERSION} ./build.sh \
	&& rm ./build.sh

