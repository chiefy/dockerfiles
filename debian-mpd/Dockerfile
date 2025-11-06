FROM debian:trixie-slim

ENV VERBOSE=

RUN apt-get update \
    && apt-get upgrade -y --no-install-recommends \
    && apt-get install -y mpd \
    && apt-get autopurge -y \
    && apt-get clean -y

RUN mkdir -p /var/lib/mpd/cache \
    && mkdir /var/lib/mpd/db \
    && touch /var/lib/mpd/db/music \
    && chown -R mpd:audio /var/lib/mpd

USER mpd

EXPOSE 6600

CMD [ "/bin/bash", "-c", "mpd --no-daemon --stderr ${VERBOSE}" ]
