FROM debian:bookworm
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    gnupg && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/apt/keyrings \
    && wget -q -O /etc/apt/keyrings/mopidy-archive-keyring.gpg \
    https://apt.mopidy.com/mopidy-archive-keyring.gpg \
    && wget -q -O /etc/apt/sources.list.d/mopidy.sources https://apt.mopidy.com/bookworm.sources \
    && apt update \
    && apt install -y mopidy \
    mopidy-mpd \
    mopidy-local \
    mopidy-alsamixer

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
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
    libxml2-dev \
    libxslt1-dev \
    libffi-dev \
    libz-dev \
    python3-setuptools \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --break-system-packages \
    Mopidy \
    Mopidy-MPD \
    Mopidy-Local \
    Mopidy-Iris \
    Mopidy-MusicBox-Webclient

# Create the "mopidy" user, add user to sudo group
RUN adduser mopidy sudo  \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


WORKDIR /home/mopidy
COPY mopidy.conf ./.config/mopidy/mopidy.conf
RUN chown -R mopidy /home/mopidy

EXPOSE 6600 6680

USER mopidy

# Setups local directory and database
#RUN mopidy local scan

VOLUME ["/home/mopidy/.local/share/mopidy"]

RUN mkdir /tmp/snapcast \
    && mkfifo /tmp/snapcast/snapfifo \
    && chmod 666 /tmp/snapcast/snapfifo

ENTRYPOINT ["/usr/bin/mopidy", "--config", "/home/mopidy/.config/mopidy/mopidy.conf"]
