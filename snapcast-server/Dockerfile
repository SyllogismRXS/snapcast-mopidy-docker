FROM debian:buster-slim

ARG SNAPCAST_VERSION=0.24.0

RUN  apt-get update \
  && apt-get install -y wget ca-certificates \
  && rm -rf /var/lib/apt/lists/*

COPY wget_deb.sh .
RUN chmod +x wget_deb.sh \
    && DEB_NAME=$(./wget_deb.sh $SNAPCAST_VERSION "server") \
    && apt-get update \
    && apt install -y ./${DEB_NAME} \
    && rm -rf /var/lib/apt/lists/*

COPY snapserver.conf /etc/snapserver.conf

EXPOSE 1704 1705 1780

ENTRYPOINT ["/bin/bash","-c","/usr/bin/snapserver"]
