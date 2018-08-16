FROM alpine:3.8

RUN \
    apk update && \
    apk add \
    ca-certificates \
    python3 \
    curl \
    && curl -o /tmp/get-pip.py -Ss https://bootstrap.pypa.io/get-pip.py \
    && python3 /tmp/get-pip.py \
    && pip install -U pip awscli 

ENTRYPOINT [ "aws" ]