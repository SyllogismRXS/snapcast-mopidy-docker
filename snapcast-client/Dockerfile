FROM debian:buster-slim

ARG SNAPCAST_VERSION=0.24.0

RUN  apt-get update \
  && apt-get install -y wget ca-certificates \
  && rm -rf /var/lib/apt/lists/*

## Create the "snapclient" user, add user to sudo group
#RUN adduser --disabled-password --gecos '' snapclient \
#    && adduser snapclient sudo  \
#    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY wget_deb.sh .
RUN chmod +x wget_deb.sh \
    && DEB_NAME=$(./wget_deb.sh $SNAPCAST_VERSION "client") \
    && apt-get update \
    && apt install -y ./${DEB_NAME} \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/bin/snapclient"]
