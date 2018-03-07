# https://hub.docker.com/r/yep1/s3/~/dockerfile/

FROM alpine:3.4

ENV GOPATH=/root GO15VENDOREXPERIMENT=1

RUN \
	apk update \
	&& apk add \
	ca-certificates \
	go \
	git \
	binutils \
	&& go get github.com/rlmcpherson/s3gof3r/gof3r \
	&& strip /root/bin/gof3r \
	&& apk del \
	go \
	git \
	binutils \
	&& rm /var/cache/apk/* \
	&& mv /root/bin/gof3r /usr/local/bin \
	&& ln -s /usr/local/bin/gof3r /usr/local/bin/s3 \
	&& rm -rf /root/*

ENTRYPOINT [ "/usr/local/bin/s3" ]
