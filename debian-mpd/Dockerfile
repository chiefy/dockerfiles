FROM debian:stable-slim

RUN apt-get -y update  \
    && apt-get -y upgrade \
    && apt-get -y install curl

RUN curl -LSs -o /usr/share/keyrings/deb.kaliko.me.gpg https://media.kaliko.me/kaliko.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/deb.kaliko.me.gpg] https://deb.kaliko.me/debian-backports/ stable-backports main" >> /etc/apt/sources.list.d/deb.kaliko.me.list \
    && apt-get -y update \
    && apt-get -y install mpd