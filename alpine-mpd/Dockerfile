FROM alpine:edge

ARG MPD_VERSION=0.24.6-r1

ENV VERBOSE=

LABEL version=$MPD_VERSION

RUN apk --no-cache add mpd=$MPD_VERSION sqlite-libs \
    && mkdir -p /var/lib/mpd/cache \
    && mkdir /var/lib/mpd/db \
    && touch /var/lib/mpd/db/music \
    && chown -R mpd:audio /var/lib/mpd

USER mpd

EXPOSE 6600

CMD [ "/bin/ash", "-c", "mpd --no-daemon --stderr ${VERBOSE}" ]
