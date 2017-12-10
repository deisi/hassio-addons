FROM ubuntu:latest

ENV LANG C.UTF-8

ARG SNAPCASTVERSION="0.12.0"
ARG BUILD_ARCH

RUN apt-get update \
  && apt-get install wget jq -y \
  && wget "https://github.com/badaix/snapcast/releases/download/v${SNAPCASTVERSION}/snapclient_${SNAPCASTVERSION}_${BUILD_ARCH}.deb" \
  && dpkg -i --force-all "snapclient_${SNAPCASTVERSION}_${BUILD_ARCH}.deb" \
  && apt-get -f install -y
RUN mkdir -p /root/.config/snapcast/

# Avahi with disabled dbus
ADD avahi-daemon.conf /etc/avahi/avahi-daemon.conf

# workaround to get dbus working, required for avahi to talk to dbus. This will be mounted. Doesnt work in hassio currently but I leave it heare for possible later usage.
RUN mkdir -p /var/run/dbus
VOLUME /var/run/dbus

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
