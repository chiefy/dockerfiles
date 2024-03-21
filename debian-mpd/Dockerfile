FROM debian:sid-slim

RUN apt-get update \
    && apt-get upgrade -y --no-install-recommends \
    && apt-get install -y curl ca-certificates \
    && curl -O "https://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2016.8.1_all.deb" \
    && dpkg -i ./deb-multimedia-keyring_2016.8.1_all.deb \
    && echo "deb https://www.deb-multimedia.org sid main" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y mpd \
    && apt-get remove -y curl \
    && apt-get autopurge -y \
    && apt-get clean -y

RUN mkdir -p /var/lib/mpd/db/music /var/lib/mpd/cache \
    && chown -R mpd:audio /var/lib/mpd

USER mpd

EXPOSE 6600

CMD [ "/bin/bash", "-c", "mpd --no-daemon --stderr" ]
