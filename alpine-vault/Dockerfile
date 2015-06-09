FROM alpine:latest

MAINTAINER Christopher 'Chief' Najewicz <chief@beefdisciple.com>

ADD https://bintray.com/artifact/download/mitchellh/vault/vault_0.1.2_linux_amd64.zip /tmp/vault.zip
ADD dev.hcl /etc/vault.hcl

RUN cd /bin && unzip /tmp/vault.zip && chmod +x /bin/vault && rm /tmp/vault.zip

EXPOSE 8200

ENV VAULT_ADDR "http://0.0.0.1:8200"

ENTRYPOINT ["/bin/vault", "server"]

CMD ["-config=/etc/vault.hcl"]
