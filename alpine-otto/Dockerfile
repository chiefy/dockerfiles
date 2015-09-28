FROM alpine:latest

MAINTAINER Christopher 'Chief' Najewicz <chief@beefdisciple.com>

COPY ./pkg/otto /usr/local/bin/otto

RUN chmod +x /usr/local/bin/otto

ENTRYPOINT ["/usr/local/bin/otto"]
