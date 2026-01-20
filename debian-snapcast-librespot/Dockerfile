FROM debian:stable-slim AS librespot

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/root/.cargo/bin:${PATH}"
ENV ARCH=amd64

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
        build-essential \
        libasound2-dev \
        libssl-dev \
        pkg-config \
        ca-certificates \
        curl \
        git \
    && apt-get -y clean \
    && rm -fR /var/lib/apt/lists

# Install Rust (for librespot build)
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Build librespot from source
RUN git clone https://github.com/librespot-org/librespot.git /librespot \
    && cd /librespot \
    && cargo build --release \
    && cp target/release/librespot /usr/local/bin/librespot \
    && chmod +x /usr/local/bin/librespot \
    && rm -rf /librespot

########

FROM debian:stable-slim

ENV SNAPCAST_VERSION=0.32.3
ENV SNAPCAST_PATCH_REV=-1
ENV ARCH=amd64
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt install -y curl unzip \
    && curl -Ls -o /tmp/snapserver.deb \
        "https://github.com/badaix/snapcast/releases/download/v${SNAPCAST_VERSION}/snapserver_${SNAPCAST_VERSION}${SNAPCAST_PATCH_REV}_amd64_bookworm.deb" \
    && dpkg -i /tmp/snapserver.deb || apt -f install -y \
    && rm -f /tmp/snapserver.deb \
    && apt clean -y \
    && rm -fR /var/lib/apt/lists

COPY --from=librespot /usr/local/bin/librespot /usr/local/bin/

VOLUME [ "/etc/snapserver.conf" ]

CMD [ "snapserver" ]

ENV DEVICE_NAME=Snapcast

EXPOSE 1704/tcp 1705/tcp
