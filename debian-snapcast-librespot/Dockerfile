FROM rust:latest AS librespot

RUN apt-get update \
    && apt-get -y install \
        build-essential \
        portaudio19-dev \
        curl \
        unzip \
    && apt-get -y clean && rm -fR /var/lib/apt/lists

ENV ARCH=amd64
ENV LIBRESPOT_VERSION=0.4.2

RUN cargo install librespot --version "${LIBRESPOT_VERSION}"


FROM debian:bookworm-slim

ENV SNAPCAST_VERSION=0.31.0
ENV SNAPCAST_PATCH_REV=-1
ENV ARCH=amd64

RUN apt-get update
RUN apt install -y curl unzip \
    && curl -Ls -o /tmp/snapserver.deb \
        "https://github.com/badaix/snapcast/releases/download/v${SNAPCAST_VERSION}/snapserver_${SNAPCAST_VERSION}${SNAPCAST_PATCH_REV}_amd64-bookworm.deb" \
    && dpkg -i /tmp/snapserver.deb || apt -f install -y \
    && mv /etc/snapserver.conf /etc/snapserver.conf.org \
    && rm -f /tmp/snapserver.deb \
    && apt clean -y \
    && rm -fR /var/lib/apt/lists

COPY --from=librespot /usr/local/cargo/bin/librespot /usr/local/bin/

VOLUME [ "/etc/snapserver.conf" ]

CMD [ "snapserver" ]

ENV DEVICE_NAME=Snapcast

EXPOSE 1704/tcp 1705/tcp
