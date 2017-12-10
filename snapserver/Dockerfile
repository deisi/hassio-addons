FROM ubuntu:latest

ENV LANG C.UTF-8

ARG SNAPCASTVERSION=0.12.0
ARG BUILD_ARCH

RUN apt-get update \
  && apt-get install wget jq -y \
  && wget 'https://github.com/badaix/snapcast/releases/download/v0.12.0/snapserver_0.12.0_amd64.deb' \
  && dpkg -i --force-all 'snapserver_0.12.0_amd64.deb' \
  && apt-get -f install -y

RUN mkdir -p /root/.config/snapcast/

WORKDIR /data

# Avahi with disabled dbus
ADD avahi-daemon.conf /etc/avahi/avahi-daemon.conf

# workaround to get dbus working, required for avahi to talk to dbus. This will be mounted. Doesnt work in hassio but I leave it heare for later usage possibly.
RUN mkdir -p /var/run/dbus
VOLUME /var/run/dbus

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
