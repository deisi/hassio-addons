ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install requirements for add-on
RUN apk add --no-cache \
    jq alsa-lib avahi avahi-tools libvorbis flac alsa-utils\
    && apk add --no-cache --virtual .build-dependencies build-base alsa-lib-dev linux-headers avahi-dev libvorbis-dev flac-dev git\
    && mkdir -p /usr/src \
    && cd /usr/src \
    && git clone https://github.com/badaix/snapcast.git \
    && cd snapcast \
    && git checkout fcf5997e342003513de89cc3f3c10f2abe1badc7 \
    && cd externals \
    && git submodule update --init --recursive \
    && cd .. \
    && make client\
    && apk del .build-dependencies

RUN mkdir -p /root/.config/snapcast/

# Avahi with disabled dbus
ADD avahi-daemon.conf /etc/avahi/avahi-daemon.conf

# workaround to get dbus working, required for avahi to talk to dbus. This will be mounted. Doesnt work in hassio currently but I leave it heare for possible later usage.
RUN mkdir -p /var/run/dbus
VOLUME /var/run/dbus

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
