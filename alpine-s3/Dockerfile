# https://hub.docker.com/r/yep1/s3/~/dockerfile/

FROM alpine:3.4

ENV GOPATH /root

RUN \
  apk update && \
  apk add go git binutils && \
  go get github.com/barnybug/s3 && \
  strip /root/bin/s3 && \
  apk del go git binutils && \
  rm /var/cache/apk/* && \
  mv /root/bin/s3 /usr/local/bin && \
  rm -rf /root/*

ENTRYPOINT [ "/usr/local/bin/s3" ]
