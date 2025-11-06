FROM alpine:edge

ARG MPD_VERSION=0.24.6-r0

ENV VERBOSE=

LABEL version=$MPD_VERSION

RUN apk --no-cache add mpd=$MPD_VERSION sqlite-libs \
    && touch /var/lib/mpd/db/music \
    && mkdir -p /var/lib/mpd/cache \
    && chown -R mpd:audio /var/lib/mpd

USER mpd

EXPOSE 6600

CMD [ "/bin/bash", "-c", "mpd --no-daemon --stderr ${VERBOSE}" ]
