FROM alpine:latest

MAINTAINER Christopher 'Chief' Najewicz <chief@beefdisciple.com>

ADD https://releases.hashicorp.com/vault/0.3.1/vault_0.3.1_linux_amd64.zip /tmp/vault.zip

RUN cd /bin && unzip /tmp/vault.zip && chmod +x /bin/vault && rm /tmp/vault.zip

RUN apk update && apk add ca-certificates

EXPOSE 8200

VOLUME /etc/vault.hcl

ENTRYPOINT ["/bin/vault", "server"]

CMD ["-config=/etc/vault.hcl"]
