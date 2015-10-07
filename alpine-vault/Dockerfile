FROM alpine:latest

MAINTAINER Christopher 'Chief' Najewicz <chief@beefdisciple.com>

ADD https://bintray.com/artifact/download/mitchellh/vault/vault_0.3.1_linux_amd64.zip /tmp/vault.zip

RUN cd /bin && unzip /tmp/vault.zip && chmod +x /bin/vault && rm /tmp/vault.zip

EXPOSE 8200

VOLUME /etc/vault.hcl

ENTRYPOINT ["/bin/vault", "server"]

CMD ["-config=/etc/vault.hcl"]
