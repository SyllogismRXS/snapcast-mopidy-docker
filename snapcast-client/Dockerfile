FROM debian:bookworm

RUN  apt-get update \
  && apt-get install -y wget ca-certificates \
  && rm -rf /var/lib/apt/lists/*

ARG SNAPCAST_VERSION=0.34.0
RUN wget https://github.com/snapcast/snapcast/releases/download/v${SNAPCAST_VERSION}/snapclient_${SNAPCAST_VERSION}-1_amd64_bookworm.deb

RUN apt-get update \
    && dpkg -i --force-all snapclient*.deb \
    && apt-get -f install -y \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["snapclient", "tcp://192.168.1.157:1704"]
#ENTRYPOINT ["snapclient", "tcp://192.168.1.158:1704"]
