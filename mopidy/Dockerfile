FROM debian:buster-slim
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    gnupg && \
    rm -rf /var/lib/apt/lists/*

RUN wget -q -O - https://apt.mopidy.com/mopidy.gpg | apt-key add - && \
    wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/buster.list

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    tzdata \
    sudo \
    build-essential \
    python3-dev \
    python3-pip \
    python3-gst-1.0 \
    python3-wheel \
    gir1.2-gstreamer-1.0 \
    gir1.2-gst-plugins-base-1.0 \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-libav \
    gstreamer1.0-tools \
    libspotify12 \
    libspotify-dev \
    libxml2-dev \
    libxslt1-dev \
    libffi-dev \
    libz-dev \
    python3-setuptools \
    python3-spotify && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install \
    Mopidy \
    Mopidy-MPD \
    Mopidy-Local \
    Mopidy-Spotify \
    Mopidy-Iris \
    Mopidy-MusicBox-Webclient

# Create the "mopidy" user, add user to sudo group
RUN adduser --disabled-password --gecos '' mopidy \
    && adduser mopidy sudo  \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

WORKDIR /home/mopidy
COPY mopidy.conf ./.config/mopidy/mopidy.conf
RUN chown -R mopidy /home/mopidy

EXPOSE 6600 6680

USER mopidy

# Setups local directory and database
RUN mopidy local scan

VOLUME ["/home/mopidy/.local/share/mopidy"]

RUN mkdir /tmp/snapcast \
    && mkfifo /tmp/snapcast/snapfifo \
    && chmod 666 /tmp/snapcast/snapfifo

ENTRYPOINT ["/usr/local/bin/mopidy"]
