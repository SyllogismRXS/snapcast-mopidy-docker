FROM debian:bookworm

RUN apt-get update \
  && apt-get install -y wget ca-certificates \
  && rm -rf /var/lib/apt/lists/*

ARG SNAPCAST_VERSION=0.34.0
RUN wget https://github.com/snapcast/snapcast/releases/download/v${SNAPCAST_VERSION}/snapserver_${SNAPCAST_VERSION}-1_amd64_bookworm.deb

RUN apt-get update \
    && dpkg -i --force-all snapserver*.deb \
    && apt-get -f install -y \
    && rm -rf /var/lib/apt/lists/*

COPY snapserver.conf /etc/snapserver.conf

EXPOSE 1704 1705 1780

ENTRYPOINT [ "/usr/bin/snapserver" ]
